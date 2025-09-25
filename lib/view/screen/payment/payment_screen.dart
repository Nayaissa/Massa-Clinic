import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/payment_controller.dart';
import '../../../core/constant/AppColor.dart';
import 'payment_request_screen.dart';
import 'payment_history_screen.dart';
import 'balance_screen.dart';

class PaymentScreen extends StatefulWidget {
  final int initialTab;
  
  const PaymentScreen({Key? key, this.initialTab = 0}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: widget.initialTab);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('51'.tr),
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: [
            Tab(
              icon: Icon(Icons.account_balance_wallet),
              text: 'Balance',
            ),
            Tab(
              icon: Icon(Icons.add_circle_outline),
              text: '52'.tr,
            ),
            Tab(
              icon: Icon(Icons.history),
              text: '53'.tr,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          BalanceScreen(),
          PaymentRequestScreen(),
          PaymentHistoryScreen(),
        ],
      ),
    );
  }
}
