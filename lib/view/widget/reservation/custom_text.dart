import 'package:flutter/widgets.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

// ignore: must_be_immutable
class CustomTextReservationCard extends StatelessWidget {
   CustomTextReservationCard({
    super.key,
    required this.content,
    required this.iconData,  this.satate,this.color
  });
  final String content;
  final IconData iconData;
    bool ?satate = true;
     Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData, size: 20, color: AppColor.primaryColor),
        const SizedBox(width: 8),
        Text(
          content,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color:satate! ? AppColor.gery800 : color,
          ),
        ),
      ],
    );
  }
}
