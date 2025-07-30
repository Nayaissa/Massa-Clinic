import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomContainerIcon extends StatelessWidget {
  const CustomContainerIcon({super.key, this.icon, this.onPressedIcon});
  final IconData ?icon;
  final void Function()? onPressedIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed:onPressedIcon,
        icon: Icon(
        icon ,
          size: 25,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
