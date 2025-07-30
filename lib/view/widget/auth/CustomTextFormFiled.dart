import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    this.myController,
    this.valid,
    this.isNumber,
    this.obscureText,
    this.iconprefix,
    this.onTap,
  });
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController? myController;
  final String? Function(String?)? valid;
  bool? isNumber = false;
  bool? obscureText;
  final IconData? iconprefix;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: obscureText == null || obscureText== false ? false : true,
        keyboardType:
            isNumber == true
                ? TextInputType.numberWithOptions(decimal: true)
                : TextInputType.text,
        validator: valid,
        controller: myController,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 12),
          contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 30),
          label: Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            child: Text(labelText),
          ),
          suffixIcon: Icon(iconData, color: Colors.grey),
          prefixIcon: InkWell(onTap: onTap, child: Icon(iconprefix)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
