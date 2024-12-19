import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/custom_button.dart';

import 'package:blood_donation_mobile/component/custom_text_form.dart';
import 'package:blood_donation_mobile/route/route.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestForm extends StatelessWidget {
  const RequestForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: "Create A Request",
        onNotificationPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                CustomTextFormField(icon: Icons.person, label: 'Name'),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(icon: Icons.location_on, label: "Location"),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(icon: Icons.bloodtype, label: "Blood Type"),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(icon: Icons.phone, label: "Mobile"),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                    icon: Icons.note_outlined, label: "Add Note"),
              ],
            ),
            SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: "Request",
                  onpressed: () => Get.offAllNamed(AppRoute.dash),
                ))
          ],
        ),
      ),
    );
  }
}
