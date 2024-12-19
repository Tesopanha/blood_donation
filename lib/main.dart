//import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:blood_donation_mobile/pages/auth/controller/authentication_controller.dart';
import 'package:blood_donation_mobile/pages/dashboard/binding/binding.dart';
import 'package:blood_donation_mobile/route/route.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthenticationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blood Donation',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
      //   useMaterial3: true,
      // ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splash,
      getPages: routes,
      initialBinding: Dashbinding(),
    );
  }
}
