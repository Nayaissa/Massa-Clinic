import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/home/homepage_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomApparServices extends GetView<HomeControllerImp> {
  const CustomApparServices({
    super.key,
    required this.title,
    required this.prefixIcon,
    this.onPressed,
    this.onPressedsearch,
    this.onChanged,
    this.search
  });
  final String title;
  final IconData prefixIcon;
  final void Function()? onPressed;
  final void Function()? onPressedsearch;
    final TextEditingController ?search;
   final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
               onChanged:onChanged ,
              controller: search,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                prefixIcon: IconButton(
                  color: AppColor.primaryColor,
                  onPressed: onPressedsearch,
                  icon: Icon(prefixIcon),
                ),
                hintText: title,
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Container(
            width: 60,
            margin:
              
                    
                
                     EdgeInsets.only(left: 5),
                 

            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.filter_list_sharp,
                size: 25,
                color: AppColor.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
