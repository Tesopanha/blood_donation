import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/pages/dashboard/controller/navigate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DashBoard extends GetView<NavigateController> {
  const DashBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView(
        controller: controller.pageController,
        children: controller.screen,
        onPageChanged: (index) {
          controller.selectedIndex.value = index;
        },
      ),
      bottomNavigationBar: Obx(
        () => GNav(
          tabMargin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          gap: 3,
          activeColor: AppColors.darkBlue,
          iconSize: 24,
          padding: const EdgeInsets.all(10),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.grey[100]!,
          color: AppColors.grey,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.book_rounded,
              text: 'Report',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
          selectedIndex: controller.selectedIndex.value,
          onTabChange: (index) {
            controller.changeScreenIndex(index);
          },
        ),
      ),
    );
  }
}
