import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/payment_controller.dart';
import '../../../data/model/payment_model.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/class/statusrequest.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());
    return Scaffold(
      appBar: AppBar(
        title: Text('53'.tr),
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => Get.find<PaymentController>().getUserPayments(),
          ),
        ],
      ),
      body: GetBuilder<PaymentController>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (controller.payments.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.payment, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    '80'.tr,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.payments.length,
            itemBuilder: (context, index) {
              PaymentModel payment = controller.payments[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with amount and status
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${payment.amount?.toStringAsFixed(0) ?? '0'} ل.س',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Color(int.parse(payment.statusColor)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              payment.statusText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Payment details
                      _buildDetailRow('76'.tr, payment.paymentMethodName ?? 'غير محدد'),
                      _buildDetailRow('74'.tr, controller.formatDate(payment.createdAt)),
                      
                      if (payment.updatedAt != payment.createdAt)
                        _buildDetailRow('تاريخ آخر تحديث', controller.formatDate(payment.updatedAt)),
                      
                      if (payment.adminNote != null && payment.adminNote!.isNotEmpty)
                        _buildDetailRow('ملاحظة الإدارة', payment.adminNote!),
                      
                      if (payment.screenshotUrl != null && payment.screenshotUrl!.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () {
                            // Open image in full screen
                            Get.dialog(
                              Dialog(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'صورة الإثبات',
                                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 16),
                                      Image.network(
                                        payment.screenshotUrl!,
                                        fit: BoxFit.contain,
                                        errorBuilder: (context, error, stackTrace) {
                                          return const Text('خطأ في تحميل الصورة');
                                        },
                                      ),
                                      const SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: () => Get.back(),
                                        child: const Text('إغلاق'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: AppColor.primaryColor),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.image, size: 16, color: AppColor.primaryColor),
                                SizedBox(width: 4),
                                Text(
                                  'عرض الصورة',
                                  style: TextStyle(color: AppColor.primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
