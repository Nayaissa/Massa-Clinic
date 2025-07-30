import 'package:flutter/widgets.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class RecentComplaintsHeader extends StatelessWidget {
  const RecentComplaintsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text("Recent Complaints", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: AppColor.gery800)),
        Text("View All", style: TextStyle(color:AppColor.primaryColor, fontWeight: FontWeight.w500)),
      ],
    );
  }
}