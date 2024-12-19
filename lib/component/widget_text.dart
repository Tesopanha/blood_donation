import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;

  const BigText({
    super.key,
    required this.text,
    this.size = 22,
    this.color = AppColors.darkGrey,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const SmallText(
      {super.key,
      required this.text,
      this.size = 14,
      this.color = AppColors.darkGrey,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight),
      textAlign: textAlign,
    );
  }
}
