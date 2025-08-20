import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomLocationField extends StatelessWidget {
  final String label;
  final String? selectedValue;
  final List<String> items;
  final Function(String?) onChanged;

  const CustomLocationField({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
         fillColor: AppColor.thirdColor.withOpacity(0.34),
        prefixIcon:  Icon(Icons.location_on, color: Colors.grey[600]),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColor.secondaryColor, width: 1),
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
    );
  }
}
