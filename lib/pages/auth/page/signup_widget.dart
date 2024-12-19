import 'package:blood_donation_mobile/pages/auth/controller/authentication_controller.dart';
import 'package:blood_donation_mobile/component/custom_button.dart';

import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupWidget extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phonenumberController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SignupWidget({
    required this.firstNameController,
    required this.lastNameController,
    required this.phonenumberController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  final AuthenticationController controller =
      Get.find<AuthenticationController>();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _signupFormKey,
            child: ListView(
              children: [
                _customForm("First Name",
                    controller: widget.firstNameController),
                const SizedBox(height: 16),
                _customForm("Last Name", controller: widget.lastNameController),
                const SizedBox(height: 16),
                _customForm("Phone Number",
                    controller: widget.phonenumberController),
                const SizedBox(height: 16),
                _customForm("Password",
                    controller: widget.passwordController,
                    isPassword: true,
                    isVisible: isPasswordVisible,
                    onVisibleToggle: _togglePasswordVisibility),
                const SizedBox(height: 16),
                _customForm("Comfirm Password",
                    controller: widget.confirmPasswordController,
                    isPassword: true,
                    isVisible: isConfirmPasswordVisible,
                    onVisibleToggle: _toggleConfirmPasswordVisibility),

                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: "Sign up",
                    onpressed: () async {
                      if (_signupFormKey.currentState?.validate() ?? false) {
                        String firstName = widget.firstNameController.text;
                        String lastName = widget.lastNameController.text;
                        String phoneNumber = widget.phonenumberController.text;
                        String password = widget.passwordController.text;
                        String confirmPassword =
                            widget.confirmPasswordController.text;
                        try {
                          await controller.register(
                            firstName,
                            lastName,
                            phoneNumber,
                            password,
                            confirmPassword,
                          );
                          if (controller.registerModel.value != null) {
                            Get.toNamed(AppRoute.verification, arguments: {
                              'phoneNumber': phoneNumber,
                              'otp': controller.registerModel.value?.otp
                            });
                          } else {
                            print("Registration failed: Unknown error");
                          }
                        } catch (e) {
                          Get.snackbar("Error", "Registration failed: $e",
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(height: 24),
                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SmallText(
                      text: "Already have an account? ",
                      size: 16,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const SmallText(
                        text: "Log In",
                        size: 16,
                        color: AppColors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget _customForm(
    String text, {
    required TextEditingController controller,
    bool isPassword = false,
    bool isVisible = false,
    VoidCallback? onVisibleToggle,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && !isVisible,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
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
              : null),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$text is required';
        }
        return null;
      },
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordVisible = !isConfirmPasswordVisible;
    });
  }
}
