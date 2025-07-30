import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  const CustomTextTitleAuth({super.key, required this.text, required this.textAlign});
  final String text;
   final TextAlign  textAlign;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.displayMedium!.copyWith(color: const Color.fromARGB(147, 0, 0, 0)),
    );
  }
}
