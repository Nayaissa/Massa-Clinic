import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomBottonAppar extends StatelessWidget {
  const CustomBottonAppar({
    super.key,
    required this.textbutton,
    required this.iconData,
    this.onPressed,
    required this.active,
  });

  final String textbutton;
  final IconData iconData;
  final void Function()? onPressed;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: MaterialButton(
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: active ? AppColor.primaryColor :AppColor.gery800,
             size: active ? 26 : 21, 
            ),
            // const SizedBox(height: 4),
            Text(
              textbutton,
              style: TextStyle(
                color: active ? AppColor.primaryColor :AppColor.gery800,
                fontWeight: active ? FontWeight.bold : FontWeight.normal,
               fontSize: active ? 12 : 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
