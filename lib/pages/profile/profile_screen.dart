import 'package:blood_donation_mobile/component/appbar_widget.dart';

import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<String> inforType = ['Blood Type', 'Donated', 'Request'];
  final List<String> inforDonor = ['O+', '03', '06'];
  bool isActive = false;
  final List<Map<dynamic, dynamic>> feature = [
    {'asset/icons/Availble.png': 'Avaible for donate'},
    {'asset/icons/Invite.png': 'Invite a friend'},
    {'asset/icons/edit.png': 'Edit Profile'},
    {'asset/icons/Setting.png': 'Setting'},
    {'asset/icons/Signout.png': 'Sign Out'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        showBackButton: false,
        text: 'Prolife',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () => Get.toNamed(AppRoute.editProfile),
                    child: const SmallText(
                      text: "Edit",
                      size: 18,
                    ))),
            CircleAvatar(
              maxRadius: 60,
              backgroundColor: AppColors.lightGrey,
              child: Image.asset(
                'asset/icons/Vector.png',
                color: AppColors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const BigText(
              text: "Van Chackriya",
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('asset/icons/call.png'),
                const SizedBox(width: 10),
                const SmallText(
                  text: "General Hospital, Phnom Penh",
                  size: 18,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, _) => const VerticalDivider(),
                  itemCount: inforDonor.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final detail = inforDonor[index];
                    final type = inforType[index];
                    return SizedBox(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BigText(
                            text: detail,
                            fontWeight: FontWeight.bold,
                            size: 28,
                          ),
                          SmallText(
                            text: type,
                            size: 16,
                          )
                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 40,
            ),
            ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                separatorBuilder: (context, _) => const Divider(
                      height: 40,
                    ),
                itemCount: feature.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final detail = feature[index];
                  final key = detail.keys.first;

                  return GestureDetector(
                    onTap: () {
                      if (index == 3) Get.toNamed(AppRoute.setting);
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: Image.asset(
                            key,
                            fit: BoxFit.fill,
                            color: AppColors.darkBlue,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(
                          text: detail[key],
                          size: 18,
                        ),
                        if (index == 0)
                          Switch(
                            value: isActive,
                            onChanged: (value) {},
                          ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
