import 'package:blood_donation_mobile/component/appbar_widget.dart';

import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificatonScreen extends StatelessWidget {
  const NotificatonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: "Notification",
        onNotificationPressed: () => Get.back(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView(
          children: [
            const BigText(
              text: "Today",
              fontWeight: FontWeight.bold,
              color: Colors.black,
              size: 24,
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (_, context) => const SizedBox(
                height: 20,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                    height: 170,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                              backgroundColor: AppColors.lightGrey,
                              child: Image.asset(
                                'asset/icons/Blood.png',
                                height: 28,
                              )),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SmallText(
                              text: 'Donation Update',
                              color: AppColors.darkGrey,
                              size: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            const SmallText(
                              text:
                                  "Your recent donation has been \nsuccessfully processed",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    width: 110,
                                    height: 45,
                                    child: customButton(
                                      "View Details",
                                    )),
                                const SizedBox(
                                  width: 18,
                                ),
                                SizedBox(
                                    width: 70,
                                    height: 45,
                                    child: customButton(
                                      "Share",
                                    )),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 100),
                          child: SmallText(
                            text: "23min",
                            size: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget customButton(String text) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightGrey,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: SmallText(
          text: text,
          color: AppColors.darkBlue,
          fontWeight: FontWeight.bold,
          size: 16,
        ));
  }
}
