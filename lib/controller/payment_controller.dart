import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import '../core/class/diohelper.dart';
import '../core/class/statusrequest.dart';
import '../core/services/services.dart';
import '../data/model/payment_method_model.dart';
import '../data/model/payment_model.dart';
import '../data/model/user_balance_model.dart';

class PaymentController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();

  List<PaymentMethodModel> paymentMethods = [];
  List<PaymentModel> payments = [];
  PaymentMethodModel? selectedPaymentMethod;
  double amount = 0.0;
  File? selectedImage;
  Uint8List? selectedImageBytes; // For web compatibility
  final ImagePicker picker = ImagePicker();
  
  // User balance
  UserBalanceModel? userBalance;
  double get currentBalance => userBalance?.balance ?? 0.0;
  
  // Check if image is selected (works for both web and mobile)
  bool get hasImageSelected => kIsWeb ? selectedImageBytes != null : selectedImage != null;

  @override
  void onInit() {
    super.onInit();
    getPaymentMethods();
    getUserPayments();
    getUserBalance();
  }

  // Get payment methods
  getPaymentMethods() async {
    statusRequest = StatusRequest.loading;
    update();
    
    try {
      var response = await DioHelper.getData(url: '/api/payment-methods');
      if (response != null && response.statusCode == 200) {
        if (response.data is List) {
          paymentMethods = response.data.map<PaymentMethodModel>((e) => PaymentMethodModel.fromJson(e)).toList();
          statusRequest = StatusRequest.success;
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    } catch (e) {
      statusRequest = StatusRequest.exceptionfailure;
    }
    update();
  }

  // Get user payments
  getUserPayments() async {
    statusRequest = StatusRequest.loading;
    update();
    
    try {
      var response = await DioHelper.getDataa(url: '/api/payments');
      
      if (response != null && (response.statusCode == 200 || response.statusCode == 201)) {
        if (response.data is List) {
          payments = response.data.map<PaymentModel>((e) => PaymentModel.fromJson(e)).toList();
          statusRequest = StatusRequest.success;
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    } catch (e) {
      statusRequest = StatusRequest.exceptionfailure;
    }
    update();
  }

  // Create payment request
  createPayment() async {
    if (selectedPaymentMethod == null) {
      Get.snackbar("85".tr, "81".tr);
      return;
    }
    if (amount <= 0) {
      Get.snackbar("85".tr, "82".tr);
      return;
    }

    statusRequest = StatusRequest.loading;
    update();

    try {
      // Build form data
      dio.FormData formData = dio.FormData.fromMap({
        "amount": amount.toString(),
        "payment_method_id": selectedPaymentMethod!.id.toString(),
        if (selectedImage != null && !kIsWeb)
          "screenshot": await dio.MultipartFile.fromFile(
            selectedImage!.path,
            filename: selectedImage!.path.split('/').last,
          ),
        if (selectedImageBytes != null && kIsWeb)
          "screenshot": dio.MultipartFile.fromBytes(
            selectedImageBytes!,
            filename: "screenshot.jpg",
          ),
      });

      var response = await DioHelper.dioClient!.post(
        '/api/payments',
        data: formData,
        options: dio.Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${await _getToken()}",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("86".tr, "83".tr);
        getUserPayments(); // Refresh payments list
        resetForm();
        statusRequest = StatusRequest.success;
      } else {
        Get.snackbar("85".tr, response.data['message'] ?? "84".tr);
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      Get.snackbar("85".tr, "84".tr);
      statusRequest = StatusRequest.exceptionfailure;
    }
    update();
  }

  // Helper method to get token
  Future<String> _getToken() async {
    return myServices.sharedPreferences.getString('token') ?? '';
  }

  // Select payment method
  selectPaymentMethod(PaymentMethodModel? method) {
    selectedPaymentMethod = method;
    update();
  }

  // Select balance payment
  selectBalancePayment() {
    selectedPaymentMethod = null;
    update();
  }

  // Set amount
  setAmount(double value) {
    amount = value;
    update();
  }

  // Pick image
  pickImage() async {
    if (kIsWeb) {
      // Web platform - use bytes
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        selectedImageBytes = await image.readAsBytes();
        update();
      }
    } else {
      // Mobile platform - use File
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        selectedImage = File(image.path);
        update();
      }
    }
  }

  // Remove image
  removeImage() {
    selectedImage = null;
    selectedImageBytes = null;
    update();
  }

  // Reset form
  resetForm() {
    selectedPaymentMethod = null;
    amount = 0.0;
    selectedImage = null;
    selectedImageBytes = null;
    update();
  }

  // Get user balance
  getUserBalance() async {
    try {
      var response = await DioHelper.getDataa(url: '/api/user/balance');
      
      if (response != null && (response.statusCode == 200 || response.statusCode == 201)) {
        userBalance = UserBalanceModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error getting user balance: $e");
    }
    update();
  }

  // Deduct balance for reservation payment
  deductBalance(double amount, int reservationId) async {
    try {
      var response = await DioHelper.postsData(
        url: '/api/user/balance/deduct',
        data: {
          'amount': amount,
          'reservation_id': reservationId,
        },
      );

      if (response != null && (response.statusCode == 200 || response.statusCode == 201)) {
        // Refresh balance
        getUserBalance();
        Get.snackbar('Success', 'Payment successful');
        return true;
      } else {
        Get.snackbar('Error', response?.data['error'] ?? 'Payment failed');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Payment failed: $e');
      return false;
    }
  }

  // Check if user has sufficient balance
  bool hasSufficientBalance(double amount) {
    return currentBalance >= amount;
  }

  // Get payment method type text
  String getPaymentMethodTypeText(String type) {
    switch (type) {
      case 'SYRIATEL_CASH':
        return '69'.tr;
      case 'SHAM_CASH':
        return '70'.tr;
      case 'MTN_CASH':
        return '71'.tr;
      case 'BANK_TRANSFER':
        return '72'.tr;
      default:
        return type;
    }
  }

  // Format date
  String formatDate(String? dateString) {
    if (dateString == null) return '';
    try {
      DateTime date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return dateString;
    }
  }
}
