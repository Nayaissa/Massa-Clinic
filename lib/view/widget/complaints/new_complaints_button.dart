import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class NewComplaintButton extends StatelessWidget {
  const NewComplaintButton({super.key, required this.text,  required this.colorbutton, this.onPressed});
  final String text;
  final Color colorbutton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add),
        label:  Text(
          text,
          style: TextStyle(color: AppColor.primaryColor),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: colorbutton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
