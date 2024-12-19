import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData? icon;
  final String label;
  const CustomTextFormField({super.key, this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: label,
          hintStyle: const TextStyle(color: AppColors.grey),
          prefixIcon: Icon(
            icon,
            color: AppColors.grey,
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.lightGrey))),
    );
  }
}
