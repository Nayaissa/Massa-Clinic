import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/services_controller.dart';

class ListClassfication extends GetView<ServicreControllerImp> {
  const ListClassfication({
    super.key,
    this.onTap,
    this.color,
    this.colortext,
   required this.nameCat
  });
  final void Function()? onTap;
  final Color? color;
  final Color? colortext;
 final  String nameCat;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
        ),
        child: Center(
          child: Text(
            nameCat,
            style: TextStyle(
              height: 1.1,
              fontWeight: FontWeight.bold,
              color: colortext,
            ),
          ),
        ),
      ),
    );
  }
}
