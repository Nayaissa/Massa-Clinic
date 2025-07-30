import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.title, required this.subtitle});
  final String title;
    final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                subtitle,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
            ),
          ),

          Positioned(
            top: -30,
            right: -60,

            child: Container(
              // height: 160,
              // width: 160,
              // decoration: BoxDecoration(
              //   color:  AppColor.thirdColor,
              //   borderRadius: BorderRadius.circular(160),
                
              // ),
              child: Image.asset('assets/images/sale.png',fit: BoxFit.fill,),
            ),
          ),
        ],
      ),
    );
  }
}
