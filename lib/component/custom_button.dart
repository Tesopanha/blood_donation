import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onpressed;
  const CustomButton({
    super.key,
    required this.text,
    this.color = AppColors.darkBlue,
    this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onpressed ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: BigText(
          text: text,
          color: AppColors.white,
          size: 20,
        ));
  }
}
