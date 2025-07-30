import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomApparReservation extends StatelessWidget {
  const CustomApparReservation({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return
    //  Container(
      
    //   padding: EdgeInsets.only(top: 12, left: 4),
    //   height: 70,
    //   width: double.infinity,
    //   decoration: BoxDecoration(
    //       boxShadow: const [BoxShadow(color: AppColor.thirdColor, blurRadius: 5)],
    //     color: Colors.white,
    //     borderRadius: BorderRadius.only(
    //       bottomLeft: Radius.circular(15),
    //       bottomRight: Radius.circular(15),
    //     ),
    //   ),
    //   child: Row(
    //     children: [
    //       Icon(icon),
    //       SizedBox(width: 6),
          // Text(
          //   title,
          //   style: TextStyle(
          //     fontSize: 22,
          //     fontWeight: FontWeight.w200,
          //     color: AppColor.gery800,
          //   ),
    //       ),
    //     ],
    //   ),
    // );
 
  Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: const BoxDecoration(
         boxShadow:  [BoxShadow(color: AppColor.thirdColor, blurRadius: 5)],
        color:AppColor.backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          
          IconButton(onPressed: (){}, icon: Icon(icon),iconSize: 18,),
          // const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
              
                      Text(
                       title,
              style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w200,
              color: AppColor.gery800,
            ),)
              ],
            ),
          ),
        
        ],
      ),
    );
  }
}
