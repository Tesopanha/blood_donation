import 'package:blood_donation_mobile/component/appbar_widget.dart';

import 'package:blood_donation_mobile/component/widget_cart.dart';
import 'package:blood_donation_mobile/pages/home/controller/home_controller.dart';
import 'package:blood_donation_mobile/route/route.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestBloodScreen extends StatefulWidget {
  const RequestBloodScreen({super.key});

  @override
  State<RequestBloodScreen> createState() => _RequestBloodScreenState();
}

class _RequestBloodScreenState extends State<RequestBloodScreen> {
  final _controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: "Request Donation",
        onNotificationPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
            separatorBuilder: (context, _) => const SizedBox(
                  height: 10,
                ),
            itemCount: _controller.requestBloodList.length,
            itemBuilder: (context, index) {
              final detail = _controller.requestBloodList[index];

              return GestureDetector(
                onTap: () => Get.toNamed(AppRoute.detail,
                    arguments: {'type': 'request', 'detail': detail}),
                child: CardRequest(
                    name: "aa",
                    bloodType: detail.bloodType,
                    location: detail.location,
                    time: detail.createdAt.toString()),
              );
            }),
      ),
    );
  }
}
