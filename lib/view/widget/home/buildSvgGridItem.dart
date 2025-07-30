import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class BuildSvgGridItem extends StatelessWidget {
  const BuildSvgGridItem({super.key, required this.title, required this.svgPath, this.onTap});
  final String title;
  final String svgPath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),

          InkWell(
            onTap:onTap ,
            child: Image.asset(
              svgPath,
              width: 40,
              height: 40,
              color: AppColor.primaryColor,
              //colorFilter: const ColorFilter.mode(Colors.amber, BlendMode.srcIn),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
