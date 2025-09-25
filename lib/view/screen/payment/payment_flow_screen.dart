import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/payment_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/view/widget/auth/CustomButtonAuth.dart';
import 'package:massaclinic/view/widget/auth/CustomTextFormFiled.dart';
import 'payment_screen.dart';

class PaymentFlowScreen extends StatelessWidget {
  final double servicePrice;
  final String serviceName;
  final int? reservationId;
  final VoidCallback? onPaymentSuccess;

  const PaymentFlowScreen({
    Key? key,
    required this.servicePrice,
    required this.serviceName,
    this.reservationId,
    this.onPaymentSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());
    
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text('51'.tr),
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder<PaymentController>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Service Info Card
                _buildServiceInfoCard(),
                const SizedBox(height: 16),
                
                // Payment Options
                _buildPaymentOptions(controller),
                const SizedBox(height: 16),
                
                // Balance Info
                _buildBalanceInfo(controller),
                const SizedBox(height: 16),
                
                // Payment Form
                if (controller.selectedPaymentMethod != null)
                  _buildPaymentForm(controller),
                
                const SizedBox(height: 24),
                
                // Action Buttons
                _buildActionButtons(controller),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildServiceInfoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '216'.tr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              serviceName,
              style: TextStyle(
                fontSize: 16,
                color: AppColor.gery800,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '217'.tr + ':',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.gery800,
                  ),
                ),
                Text(
                  '${servicePrice.toStringAsFixed(0)} ل.س',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOptions(PaymentController controller) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '56'.tr, // Payment Method
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 15),
            
            // Balance Payment Option
            _buildPaymentOption(
              title: '211'.tr, // Pay with Balance
              subtitle: 'Current Balance: ${controller.currentBalance.toStringAsFixed(0)} ل.س',
              icon: Icons.account_balance_wallet,
              isSelected: controller.selectedPaymentMethod == null,
              onTap: () => controller.selectBalancePayment(),
              isEnabled: controller.hasSufficientBalance(servicePrice),
            ),
            
            const SizedBox(height: 10),
            
            // External Payment Methods
            ...controller.paymentMethods.map((method) => 
              _buildPaymentOption(
                title: method.nameAr ?? method.name ?? '',
                subtitle: method.type ?? '',
                icon: _getPaymentMethodIcon(method.type ?? ''),
                isSelected: controller.selectedPaymentMethod?.id == method.id,
                onTap: () => controller.selectPaymentMethod(method),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    bool isEnabled = true,
  }) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor.withOpacity(0.1) : Colors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppColor.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isEnabled 
                ? (isSelected ? AppColor.primaryColor : AppColor.gery800)
                : Colors.grey,
              size: 24,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isEnabled 
                        ? (isSelected ? AppColor.primaryColor : AppColor.gery800)
                        : Colors.grey,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: isEnabled ? AppColor.gery800 : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppColor.primaryColor,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceInfo(PaymentController controller) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: controller.hasSufficientBalance(servicePrice) 
          ? Colors.green.withOpacity(0.1)
          : Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: controller.hasSufficientBalance(servicePrice) 
            ? Colors.green
            : Colors.orange,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            controller.hasSufficientBalance(servicePrice) 
              ? Icons.check_circle
              : Icons.warning,
            color: controller.hasSufficientBalance(servicePrice) 
              ? Colors.green
              : Colors.orange,
            size: 24,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              controller.hasSufficientBalance(servicePrice)
                ? '220'.tr
                : '221'.tr,
              style: TextStyle(
                fontSize: 14,
                color: controller.hasSufficientBalance(servicePrice) 
                  ? Colors.green[700]
                  : Colors.orange[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentForm(PaymentController controller) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '219'.tr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 15),
            
            CustomTextFormFiled(
              myController: TextEditingController(text: servicePrice.toString()),
              hintText: '55'.tr, // Enter Amount
              labelText: '54'.tr, // Amount (SYP)
              iconData: Icons.attach_money,
            ),
            const SizedBox(height: 15),
            
            // Screenshot upload
            if (controller.selectedImage != null)
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.image, color: AppColor.primaryColor),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Screenshot uploaded',
                        style: TextStyle(color: AppColor.gery800),
                      ),
                    ),
                    IconButton(
                      onPressed: controller.removeImage,
                      icon: Icon(Icons.close, color: Colors.red),
                    ),
                  ],
                ),
              )
            else
              GestureDetector(
                onTap: controller.pickImage,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.primaryColor,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.cloud_upload,
                        size: 40,
                        color: AppColor.primaryColor,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '63'.tr, // Payment Proof
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(PaymentController controller) {
    return Column(
      children: [
        // Add Balance Button
        if (!controller.hasSufficientBalance(servicePrice))
          CustomButtonAuth(
            textButton: '213'.tr,
            onPressed: () {
              Get.to(() => PaymentScreen(initialTab: 1)); // Navigate to Add Payment tab
            },
          ),
        
        const SizedBox(height: 10),
        
        // Pay Button
        SizedBox(
          width: double.infinity,
          child: CustomButtonAuth(
            textButton: controller.selectedPaymentMethod == null 
              ? (reservationId != null ? 'Pay with Balance' : '211'.tr)
              : 'Pay with ${controller.selectedPaymentMethod?.nameAr ?? controller.selectedPaymentMethod?.name ?? ''}',
            onPressed: () => _processPayment(controller),
          ),
        ),
      ],
    );
  }

  void _processPayment(PaymentController controller) async {
    if (controller.selectedPaymentMethod == null) {
      // Pay with balance
      if (reservationId != null) {
        // This is for an overdue reservation
        bool success = await controller.deductBalance(servicePrice, reservationId!);
        if (success) {
          onPaymentSuccess?.call();
          Get.back();
        }
      } else {
        // This is for a new service booking
        Get.snackbar('Error', 'Balance payment for new bookings not implemented');
      }
    } else {
      // Pay with external method
      controller.setAmount(servicePrice);
      await controller.createPayment();
      if (controller.statusRequest == StatusRequest.success) {
        onPaymentSuccess?.call();
        Get.back();
      }
    }
  }

  IconData _getPaymentMethodIcon(String type) {
    switch (type.toUpperCase()) {
      case 'SYRIATEL_CASH':
        return Icons.phone_android;
      case 'SHAM_CASH':
        return Icons.phone_android;
      case 'BANK_TRANSFER':
        return Icons.account_balance;
      case 'WESTERN_UNION':
        return Icons.money;
      default:
        return Icons.payment;
    }
  }
}