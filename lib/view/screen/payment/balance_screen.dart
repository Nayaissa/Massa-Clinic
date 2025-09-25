import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/payment_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/view/widget/auth/CustomButtonAuth.dart';
import 'payment_screen.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());
    
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text('206'.tr),
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => Get.find<PaymentController>().getUserBalance(),
          ),
        ],
      ),
      body: GetBuilder<PaymentController>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Balance Card
                _buildBalanceCard(controller),
                const SizedBox(height: 16),
                
                // Quick Actions
                _buildQuickActions(controller),
                const SizedBox(height: 16),
                
                // Recent Transactions
                _buildRecentTransactions(controller),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBalanceCard(PaymentController controller) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '207'.tr,
                      style: TextStyle(
                        color: AppColor.gery800,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${controller.currentBalance.toStringAsFixed(0)} ل.س',
                      style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.account_balance_wallet,
                    color: AppColor.primaryColor,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                textButton: '208'.tr,
                onPressed: () {
                  Get.to(() => PaymentScreen(initialTab: 1)); // Navigate to Add Payment tab
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(PaymentController controller) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '209'.tr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 15),
            
            Row(
              children: [
                Expanded(
                  child: _buildQuickActionCard(
                    icon: Icons.add_circle_outline,
                    title: 'Add Balance',
                    subtitle: 'Top up your account',
                    color: AppColor.primaryColor,
                    onTap: () => Get.to(() => PaymentScreen(initialTab: 1)), // Add Payment tab
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildQuickActionCard(
                    icon: Icons.history,
                    title: 'History',
                    subtitle: 'View transactions',
                    color: Colors.green,
                    onTap: () => Get.to(() => PaymentScreen(initialTab: 2)), // Payment History tab
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: color,
                fontSize: 14,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: AppColor.gery800,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTransactions(PaymentController controller) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Text(
              '210'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
                TextButton(
                  onPressed: () => Get.to(() => PaymentScreen(initialTab: 2)), // Payment History tab
                  child: Text(
                    '214'.tr,
                    style: TextStyle(color: AppColor.primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            
            if (controller.payments.isEmpty)
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(
                      Icons.receipt_long,
                      size: 50,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '80'.tr, // No payments found
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Your payment history will appear here',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            else
              ...controller.payments.take(3).map((payment) => 
                _buildTransactionItem(payment)
              ).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(dynamic payment) {
    bool isPositive = (payment.amount ?? 0) > 0;
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isPositive ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              isPositive ? Icons.add : Icons.remove,
              color: isPositive ? Colors.green : Colors.red,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  payment.paymentMethodName ?? '215'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColor.gery800,
                  ),
                ),
                Text(
                  payment.createdAt ?? '',
                  style: TextStyle(
                    color: AppColor.gery800,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${isPositive ? '+' : ''}${payment.amount?.toStringAsFixed(0) ?? '0'} ل.س',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isPositive ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}