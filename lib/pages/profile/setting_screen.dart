import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/widget_colors.dart';

import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isDarkMode = false;

  final List<Map<dynamic, dynamic>> feature = [
    {'asset/icons/dark-mode.png': 'Dark Mode'},
    {'asset/icons/notification-light.png': 'Notification'},
    {'asset/icons/Language-1.png': 'Langauage'},
    {'asset/icons/Login.png': 'Security'},
    {'asset/icons/help.png': 'Help'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: "Setting",
        showBackButton: true,
        onNotificationPressed: () => Get.back(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, _) => const Divider(
                      height: 30,
                    ),
                itemCount: feature.length,
                itemBuilder: (context, index) {
                  final detail = feature[index];
                  final key = detail.keys.first;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            key,
                            color: AppColors.darkBlue,
                            fit: BoxFit.fill,
                            width: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SmallText(text: detail[key])
                        ],
                      ),
                      if (index == 0)
                        Switch(
                          value: isDarkMode,
                          onChanged: (value) {
                            Get.isDarkMode
                                ? Get.changeTheme(ThemeData.light())
                                : Get.changeTheme(ThemeData.dark());
                          },
                        ),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
