import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomLocationField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? selectedValue;
  final List<String> items;
  final Function(String?) onChanged;

  const CustomLocationField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: const EdgeInsets.only(bottom: 15),
      child: DropdownButtonFormField<String>(
 value: selectedValue,
         decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            child: Text(labelText),
          ),
          prefixIcon: Icon(Icons.location_on, color: Colors.grey[600]),
         
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                const BorderSide(color: AppColor.secondaryColor, width: 1),
          ),
        ),
        icon: const Icon(Icons.arrow_drop_down, color: AppColor.primaryColor),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: const TextStyle(fontSize: 14)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
