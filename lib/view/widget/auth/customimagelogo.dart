import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';

class CustomImageLogo extends StatelessWidget {
  const CustomImageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAssets.logoImage,height: 170,);
  }
}