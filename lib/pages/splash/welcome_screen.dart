import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Page View
            PageView(
              controller: _controller,
              children: [
                _buildPage(
                  title: "Empower Generosity",
                  description:
                      "Effortlessly organize your tasks and projects with our intuitive app, designed to boost productivity.",
                  image: "asset/image/superhero.png",
                ),
                _buildPage(
                  title: "Connect & Give",
                  description:
                      "Effortlessly organize your tasks and projects with our intuitive app, designed to boost productivity.",
                  image: "asset/image/Blood.png",
                ),
                _buildPage(
                  title: "Impact Today",
                  description:
                      "Effortlessly organize your tasks and projects with our intuitive app, designed to boost productivity.",
                  image: "asset/image/Blood.png",
                  background: "asset/image/blood_fade.png",
                ),
              ],
            ),
            // Top Navigation
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const WormEffect(
                        activeDotColor: Colors.blue,
                        dotColor: Colors.grey,
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 8,
                        strokeWidth: 1,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoute.lan);
                        },
                        child: const BigText(
                          text: "Skip",
                          color: AppColors.darkBlue,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required String description,
    required String image,
    String? background,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 60, 0, 24),
      child: Stack(children: [
        if (background != null)
          // Background image with fade effect
          Positioned(
            bottom: 55,
            right: 0,
            child: Opacity(
              opacity: 0.3, // Adjust the opacity for fade effect
              child: SizedBox(
                height: 620,
                width: 300,
                child: Image.asset(
                  background,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 60),
            // Image centered
            Center(
              child: Image.asset(
                image,
              ),
            ),
            const SizedBox(height: 60),
            // Title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: title,
                  size: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                const SizedBox(height: 20),
                // Description
                SmallText(
                  text: description,
                  size: 18,
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
