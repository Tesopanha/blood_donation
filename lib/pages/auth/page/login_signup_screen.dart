import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/pages/auth/page/login_widget.dart';
import 'package:blood_donation_mobile/pages/auth/page/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final PageController _controller = PageController();
  final RxInt selectedPage = 0.obs;

  // TextEditingControllers for Login
  final TextEditingController loginPhoneController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  // TextEditingControllers for Signup
  final TextEditingController signupFirstNameController =
      TextEditingController();
  final TextEditingController signupLastNameController =
      TextEditingController();
  final TextEditingController signupPhoneController = TextEditingController();
  final TextEditingController signupPasswordController =
      TextEditingController();
  final TextEditingController signupConfirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to free resources
    loginPhoneController.dispose();
    loginPasswordController.dispose();
    signupFirstNameController.dispose();
    signupLastNameController.dispose();
    signupPhoneController.dispose();
    signupPasswordController.dispose();
    signupConfirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.darkBlue,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              children: [
                Obx(
                  () => header(
                    isSelected: selectedPage.value == 0,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                      //height: height,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30)),
                          color: AppColors.white),
                      child: Column(
                        children: [
                          Obx(
                            () => Container(
                              height: 55,
                              margin: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  selectedAction(
                                    title: "Login",
                                    isSelected: selectedPage.value == 0,
                                    width: width,
                                    onTap: () {
                                      selectedPage.value = 0;
                                      _controller.animateToPage(0,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut);
                                    },
                                  ),
                                  selectedAction(
                                    title: "Sign UP",
                                    isSelected: selectedPage.value == 1,
                                    width: width,
                                    onTap: () {
                                      selectedPage.value = 1;
                                      _controller.animateToPage(1,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut);
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: PageView(
                              controller: _controller,
                              onPageChanged: (index) =>
                                  selectedPage.value = index,
                              children: [
                                LoginWidget(
                                  phonenumberController: loginPhoneController,
                                  passwordController: loginPasswordController,
                                ),
                                SignupWidget(
                                  firstNameController:
                                      signupFirstNameController,
                                  lastNameController: signupLastNameController,
                                  phonenumberController: signupPhoneController,
                                  passwordController: signupPasswordController,
                                  confirmPasswordController:
                                      signupConfirmPasswordController,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ));
  }

  Widget header({required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              isSelected
                  ? 'asset/icons/Light/login.png'
                  : 'asset/icons/Light/signup.png',
            ),
          ),
          const SizedBox(height: 24),
          BigText(
            text: isSelected
                ? "Welcome! Login to get \nstarted"
                : "Hello! Register to get \nstarted",
            size: 24,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }

  Widget selectedAction({
    required String title,
    required bool isSelected,
    required double width,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: width / 2 - 25,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: BigText(
          text: title,
          size: 18,
          color: isSelected ? AppColors.darkBlue : AppColors.darkGrey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
