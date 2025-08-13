import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('note'),
      ),
      body: Center(
        child: GetBuilder<NotificationController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                controller.message,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      ),
    );
  }
}
