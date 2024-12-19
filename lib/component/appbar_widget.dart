import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool showBackButton;
  final VoidCallback? onNotificationPressed;

  const AppBarWidget({
    super.key,
    required this.text,
    this.showBackButton = true,
    this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.darkBlue,
      leading: showBackButton
          ? Padding(
              padding: const EdgeInsets.only(left: 12),
              child: IconButton(
                  onPressed: onNotificationPressed ?? () {},
                  icon: const Icon(Icons.arrow_back_ios,
                      color: AppColors.white, size: 32)))
          : null,
      title: BigText(
        text: text,
        color: AppColors.white,
      ),
      actions: [
        IconButton(
            onPressed: () {
              Get.toNamed(AppRoute.notification);
            },
            icon: const Icon(
              Icons.notifications,
              color: AppColors.white,
              size: 35,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
