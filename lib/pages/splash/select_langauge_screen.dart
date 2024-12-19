import 'package:blood_donation_mobile/component/custom_button.dart';
import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLangaugeScreen extends StatefulWidget {
  const SelectLangaugeScreen({super.key});

  @override
  State<SelectLangaugeScreen> createState() => _SelectLangaugeScreenState();
}

class _SelectLangaugeScreenState extends State<SelectLangaugeScreen> {
  String selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 65, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Column(
                children: [
                  Image.asset('asset/image/Language.png'),
                  const SizedBox(
                    height: 40,
                  ),
                  _buildLanguageOption(
                    flag: 'asset/icons/Khmer.png',
                    language: 'ភាសាខ្មែរ',
                    value: 'Khmer',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildLanguageOption(
                    flag: 'asset/icons/English.png',
                    language: 'English',
                    value: 'English',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildLanguageOption(
                    flag: 'asset/icons/Chinese.png',
                    language: 'Chinese',
                    value: 'Chinese',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: "Comfirm",
                onpressed: () => Get.offNamed(AppRoute.authPage),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption({
    required String flag,
    required String language,
    required String value,
  }) {
    bool isSelected = selectedLanguage == value;

    return Container(
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isSelected ? AppColors.blue : AppColors.grey,
          width: 1,
        ),
        color: isSelected ? AppColors.grey.withOpacity(0.1) : Colors.white,
      ),
      child: ListTile(
        onTap: () {
          setState(() {
            selectedLanguage = value;
          });
        },
        leading: Image.asset(
          flag,
          width: 30,
          height: 30,
        ),
        title: BigText(
          text: language,
          color: isSelected ? AppColors.blue : AppColors.grey,
          size: 16,
          fontWeight: FontWeight.w500,
        ),
        trailing: Radio<String>(
          value: value,
          groupValue: selectedLanguage,
          activeColor: AppColors.darkBlue,
          onChanged: (String? newValue) {
            setState(() {
              selectedLanguage = newValue!;
            });
          },
        ),
      ),
    );
  }
}
