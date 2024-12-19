import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/custom_button.dart';

import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showBackButton: true,
        text: "Forget Passworld",
        onNotificationPressed: () => Get.back(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: Image.asset("asset/icons/lock.png"),
                ),
                const SizedBox(
                  height: 40,
                ),
                const BigText(
                  text: "Forget\nPassword?",
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 30,
                ),
                const SmallText(
                  text:
                      "Don't worry! It happens. Please enter the phone\nnumber we will send the OTP in this phone\nnumber",
                  size: 18,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    prefixIconColor: AppColors.lightGrey,
                    hintText: "Phone Number",
                    hintStyle: const TextStyle(color: AppColors.lightGrey),
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.lightGrey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.lightGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.darkGrey),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: "Continue",
                  onpressed: () => Get.toNamed(AppRoute.otpverify),
                ))
          ],
        ),
      ),
    );
  }
}
