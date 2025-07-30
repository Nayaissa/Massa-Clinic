import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  const CustomTextBodyAuth({super.key, required this.textBody});
  final String textBody;
  @override
  Widget build(BuildContext context) {
    return  Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                textAlign: TextAlign.center,
                textBody,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
  }
}