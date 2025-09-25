import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/payment_controller.dart';
import '../../../data/model/payment_method_model.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/class/statusrequest.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());
    return Scaffold(
      appBar: AppBar(
        title: Text('67'.tr),
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: GetBuilder<PaymentController>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (controller.paymentMethods.isEmpty) {
            return Center(
              child: Text('68'.tr),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.paymentMethods.length,
            itemBuilder: (context, index) {
              PaymentMethodModel method = controller.paymentMethods[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text(
                    method.nameAr ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.getPaymentMethodTypeText(method.type ?? '')),
                      if (method.type == 'BANK_TRANSFER') ...[
                        if (method.bankName != null)
                          Text('${'59'.tr}: ${method.bankName}'),
                        if (method.accountName != null)
                          Text('${'60'.tr}: ${method.accountName}'),
                        if (method.accountNumber != null)
                          Text('${'61'.tr}: ${method.accountNumber}'),
                      ],
                      if (method.type?.contains('CASH') == true && method.address != null)
                        Text('${'62'.tr}: ${method.address}'),
                    ],
                  ),
                  trailing: controller.selectedPaymentMethod?.id == method.id
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : const Icon(Icons.radio_button_unchecked),
                  onTap: () {
                    controller.selectPaymentMethod(method);
                    Get.back(result: method);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
