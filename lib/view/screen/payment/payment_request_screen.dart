import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../controller/payment_controller.dart';
import '../../../data/model/payment_method_model.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/class/statusrequest.dart';
import 'payment_methods_screen.dart';

class PaymentRequestScreen extends StatelessWidget {
  const PaymentRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());
    return Scaffold(
      appBar: AppBar(
        title: Text('52'.tr),
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: GetBuilder<PaymentController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Amount input
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '54'.tr,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '55'.tr,
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            controller.setAmount(double.tryParse(value) ?? 0.0);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Payment method selection
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '56'.tr,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () async {
                            PaymentMethodModel? result = await Get.to(() => const PaymentMethodsScreen());
                            if (result != null) {
                              controller.selectPaymentMethod(result);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    controller.selectedPaymentMethod?.nameAr ?? '57'.tr,
                                    style: TextStyle(
                                      color: controller.selectedPaymentMethod != null 
                                          ? Colors.black 
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                        if (controller.selectedPaymentMethod != null) ...[
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${'58'.tr}: ${controller.getPaymentMethodTypeText(controller.selectedPaymentMethod!.type ?? '')}'),
                                if (controller.selectedPaymentMethod!.type == 'BANK_TRANSFER') ...[
                                  if (controller.selectedPaymentMethod!.bankName != null)
                                    Text('${'59'.tr}: ${controller.selectedPaymentMethod!.bankName}'),
                                  if (controller.selectedPaymentMethod!.accountName != null)
                                    Text('${'60'.tr}: ${controller.selectedPaymentMethod!.accountName}'),
                                  if (controller.selectedPaymentMethod!.accountNumber != null)
                                    Text('${'61'.tr}: ${controller.selectedPaymentMethod!.accountNumber}'),
                                ],
                                if (controller.selectedPaymentMethod!.type?.contains('CASH') == true && 
                                    controller.selectedPaymentMethod!.address != null)
                                  Text('${'62'.tr}: ${controller.selectedPaymentMethod!.address}'),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Screenshot upload
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '63'.tr,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () => controller.pickImage(),
                              icon: const Icon(Icons.camera_alt),
                              label: Text('64'.tr),
                            ),
                            if (controller.hasImageSelected) ...[
                              const SizedBox(width: 8),
                              ElevatedButton.icon(
                                onPressed: () => controller.removeImage(),
                                icon: const Icon(Icons.delete),
                                label: Text('65'.tr),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ],
                          ],
                        ),
                        if (controller.hasImageSelected) ...[
                          const SizedBox(height: 8),
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: kIsWeb 
                              ? Image.memory(
                                  controller.selectedImageBytes!,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  controller.selectedImage!,
                                  fit: BoxFit.cover,
                                ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Submit button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.statusRequest == StatusRequest.loading
                        ? null
                        : () => controller.createPayment(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: controller.statusRequest == StatusRequest.loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            '66'.tr,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
