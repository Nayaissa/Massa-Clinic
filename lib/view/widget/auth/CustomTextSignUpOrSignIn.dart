import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  const CustomTextSignUpOrSignIn({super.key, required this.textOne, required this.textTwo, this.onTap});
 final String textOne;
 final String textTwo;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return     Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textOne,

                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                InkWell(
                  onTap:onTap,
                  child: Text(
                    textTwo,

                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ],
            );
  }
}