import 'package:blood_donation_mobile/component/appbar_widget.dart';
import 'package:blood_donation_mobile/component/widget_cart.dart';
import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool isSelected = true;
  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const AppBarWidget(
        text: "Report",
        showBackButton: false,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: 55,
                decoration: BoxDecoration(
                    color: AppColors.lightGrey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTabButton("Request Donation", isSelected, width, () {
                      setState(() {
                        isSelected = true;
                      });
                    }),
                    buildTabButton("Donation Request", !isSelected, width, () {
                      setState(() {
                        isSelected = false;
                      });
                    }),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, _) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: _controller.requestBloodList.length,
                  itemBuilder: (context, index) {
                    final detail = _controller.requestBloodList[index];
                    return isSelected
                        ? InkWell(
                            // onTap: () => Get.toNamed(AppRoute.requestDetail,
                            //     arguments: detail),
                            child: CardReport(
                              name: 'aaa',
                              bloodType: detail.bloodType,
                              location: detail.location,
                              time: detail.createdAt.toString(),
                              process: true,
                            ),
                          )
                        : const CardReport(
                            name: "LORN POLIN",
                            bloodType: "B+",
                            location: "Phnom Penh, Cambodia",
                            time: '2024-12-09T14:22:18.055604Z',
                            process: false,
                          );
                  }),
            ],
          )),
    );
  }

  Widget buildTabButton(
      String text, bool isActive, final width, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: width - 250,
        decoration: BoxDecoration(
          color: isActive ? AppColors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: BigText(
            text: text,
            size: 18,
            color: isActive ? AppColors.darkBlue : AppColors.darkGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
