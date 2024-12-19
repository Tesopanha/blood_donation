import 'package:blood_donation_mobile/pages/auth/controller/authentication_controller.dart';
import 'package:blood_donation_mobile/component/custom_button.dart';

import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';

import 'package:blood_donation_mobile/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWidget extends StatefulWidget {
  final TextEditingController phonenumberController;
  final TextEditingController passwordController;

  LoginWidget({
    required this.phonenumberController,
    required this.passwordController,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  bool isRemember = false;
  final controller = Get.find<AuthenticationController>();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _loginFormKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              _customForm("Phone Number", const Icon(Icons.phone_outlined),
                  controller: widget.phonenumberController),
              const SizedBox(height: 16),
              _customForm(
                "Password",
                const Icon(Icons.lock_outline),
                controller: widget.passwordController,
                isPassword: true,
                isVisible: _isPasswordVisible,
                onVisibleToggle: _togglePasswordVisibility,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isRemember,
                        activeColor: AppColors.darkBlue,
                        onChanged: (bool? value) {
                          setState(() {
                            isRemember = value ?? false;
                          });
                        },
                      ),
                      const SmallText(
                        text: "Remember me",
                        size: 14,
                        color: AppColors.darkGrey,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.forget);
                    },
                    child: const SmallText(
                      text: "Forget Password?",
                      size: 14,
                      color: AppColors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                    text: "Login",
                    onpressed: () async {
                      // "phone": "+85512221158", "password": "panha1234"}
                      //+855772258112 , 1234567 var phone = "+85577219592";
                      // var password = "12345";

                      if (_loginFormKey.currentState?.validate() ?? false) {
                        String phone = widget.phonenumberController.text;
                        String password = widget.passwordController.text;
                        await controller.login(phone, password);
                        Get.offAllNamed(AppRoute.dash);
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customForm(String text, Icon icon,
      {required TextEditingController controller,
      bool isPassword = false,
      bool isVisible = false,
      VoidCallback? onVisibleToggle}) {
    return TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        obscureText: isPassword && !isVisible,
        decoration: InputDecoration(
          prefixIcon: icon,
          prefixIconColor: AppColors.lightGrey,
          hintText: text,
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
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.lightGrey,
                  ),
                  onPressed: onVisibleToggle,
                )
              : null,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$text is required';
          }
          return null;
        });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }
}
