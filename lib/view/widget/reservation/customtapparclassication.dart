import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/myreservation_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomStateReservation extends GetView<BookingsController> {
  const CustomStateReservation({
    super.key,
    this.onTap,
    this.color,
    this.colortext,
    this.tab
  });
  final void Function()? onTap;
  final Color? color;
  final Color? colortext;
  final String ?tab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.secondaryColor),
        ),
        child: Text(
          tab!,
          style: TextStyle(color: colortext, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
