import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardRequest extends StatelessWidget {
  final String name;
  final String bloodType;
  final String location;
  final String time;
  final bool process;
  final bool isSelected;
  const CardRequest(
      {super.key,
      required this.name,
      required this.bloodType,
      required this.location,
      required this.time,
      this.process = false,
      this.isSelected = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 180,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'asset/icons/Light/Profile.png',
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const SmallText(
                      text: "Name",
                      size: 16,
                      color: AppColors.darkGrey,
                    )
                  ],
                ),
                SmallText(
                  text: name,
                  size: 16,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  children: [
                    Image.asset(
                      'asset/icons/location.png',
                      color: AppColors.darkGrey,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const SmallText(
                      text: "Location",
                      size: 16,
                      color: AppColors.grey,
                    )
                  ],
                ),
                SmallText(
                  text: location,
                  size: 16,
                  color: AppColors.grey,
                ),
                Row(
                  children: [
                    Image.asset(
                      'asset/icons/time.png',
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const SmallText(
                      text: "Time",
                      size: 16,
                      color: AppColors.grey,
                    )
                  ],
                ),
                Row(
                  children: [
                    SmallText(text: formatTime(time)),
                    const SizedBox(
                      width: 15,
                    ),
                    if (isSelected)
                      SmallText(
                        text: process ? "Complete" : "Pending",
                        size: 16,
                        fontWeight: FontWeight.bold,
                        color: process ? Colors.green : Colors.yellow.shade800,
                      )
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(
                  text: bloodType,
                  color: Colors.black,
                  size: 24,
                  fontWeight: FontWeight.bold,
                ),
                Image.asset(
                  'asset/icons/Blood.png',
                ),
                Row(
                  children: [
                    BigText(
                      text: isSelected ? "Cancel" : "Reject",
                      color: AppColors.darkRed,
                      size: 19,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    BigText(
                      text: isSelected ? "Accept" : "Donate",
                      color: AppColors.darkBlue,
                      size: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardReport extends StatelessWidget {
  final String name;
  final String bloodType;
  final String location;
  final String time;
  final bool process;
  const CardReport(
      {super.key,
      required this.name,
      required this.bloodType,
      required this.location,
      required this.time,
      this.process = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 180,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'asset/icons/Light/Profile.png',
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const SmallText(
                      text: "Name",
                      size: 16,
                      color: AppColors.darkGrey,
                    )
                  ],
                ),
                SmallText(
                  text: name,
                  size: 16,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  children: [
                    Image.asset(
                      'asset/icons/location.png',
                      color: AppColors.darkGrey,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const SmallText(
                      text: "Location",
                      size: 16,
                      color: AppColors.grey,
                    )
                  ],
                ),
                SmallText(
                  text: location,
                  size: 16,
                  color: AppColors.grey,
                ),
                Row(
                  children: [
                    Image.asset(
                      'asset/icons/time.png',
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const SmallText(
                      text: "Time",
                      size: 16,
                      color: AppColors.grey,
                    )
                  ],
                ),
                SmallText(text: formatTime(time)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(
                  text: bloodType,
                  color: Colors.black,
                  size: 24,
                  fontWeight: FontWeight.bold,
                ),
                Image.asset(
                  'asset/icons/Blood.png',
                ),
                BigText(
                  text: process ? "Complete" : "Cancel",
                  color: process ? Colors.green : AppColors.darkRed,
                  size: 19,
                  fontWeight: FontWeight.bold,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

String formatTime(String timestamp) {
  DateTime dateTime = DateTime.parse(timestamp);
  return DateFormat.Hm().format(dateTime);
} // Outputs time in 24-hour format, like 14:22