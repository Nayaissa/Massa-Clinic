import 'package:flutter/widgets.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomTextDeatilsService extends StatelessWidget {
  const CustomTextDeatilsService({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColor.gery800,
        ),
      ),
    );
  }
}
