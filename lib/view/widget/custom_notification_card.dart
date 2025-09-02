import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

// ignore: must_be_immutable
class NotificationCard extends StatelessWidget {
   NotificationCard({
    super.key,
    required this.title,
     required this.subtitle,
      required this.time,
      this.onTap,
    
  });
  final String title;
  final String subtitle;
  final String time;
 void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(left: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.secondaryColor),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    time,
                    style: const TextStyle(color: Colors.black87, fontSize: 12),
                  ),
                  const SizedBox(height: 50),
                  InkWell(
                    onTap: onTap,
                    child: Icon(Icons.delete_outline, color: Colors.redAccent, size: 20)),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: -4,
          top: 16,
          child: Image.asset(
            'assets/images/notification.png',
            width: 70,
            height: 70,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
