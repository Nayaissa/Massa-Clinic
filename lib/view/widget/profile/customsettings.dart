import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final void Function()? onTap;

  const ProfileItem({super.key, required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.thirdColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColor.thirdColor,
              blurRadius: 6,
              spreadRadius: 1,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColor.primaryColor, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
