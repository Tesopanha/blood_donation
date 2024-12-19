import 'dart:async';

import 'package:blood_donation_mobile/pages/auth/controller/authentication_controller.dart';
import 'package:blood_donation_mobile/pages/auth/model/login_model.dart';
import 'package:blood_donation_mobile/pages/model/blood_donation_model.dart';

import 'package:blood_donation_mobile/pages/model/request_blood_model.dart';
import 'package:blood_donation_mobile/repository/api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var opacity = 1.0.obs;
  Timer? timer;
  var requestBloodList = <RequestBloodModel>[].obs;
  var bloodDonatdList = <BloodDonationModel>[].obs;

  final _apiService = ApiService();
  final authenticaionController = Get.find<AuthenticationController>();
  var loginModel = Rxn<LoginModel>();

  List<String> imageFadeIn = [
    'asset/image/slide-1.png',
    'asset/image/slide-2.png',
    'asset/image/slide-3.png'
  ].obs;

  @override
  void onInit() {
    super.onInit();
    initializeAutoSlide();
    loginModel.value = authenticaionController.loginModel.value;
    fetchRequestBlood();
    fetchBloodDonated();
  }

  Future<void> fetchRequestBlood() async {
    try {
      final token = loginModel.value?.accessToken;
      if (token != null) {
        final result = await _apiService.fetchRequestBlood(token: token);
        requestBloodList.assignAll(result);
      } else {
        print("No token found. Please login again.");
      }
    } catch (e) {
      print("Error fetching request blood: $e");
    }
  }

  Future<void> fetchBloodDonated() async {
    try {
      final token = loginModel.value?.accessToken;
      if (token != null) {
        final result = await _apiService.fetchBloodDonted(token: token);
        bloodDonatdList.assignAll(result);
      } else {
        print("No token found. Please login again.");
      }
    } catch (e) {
      print("Error fetching blood donation: $e");
    }
  }

  void startAutoSlide() async {
    if (imageFadeIn.isEmpty) {
      return; // Exit if there are no slides
    }

    if (opacity.value == 0.0) {
      // Change image once fade-out is complete
      await Future.delayed(const Duration(milliseconds: 500));
      currentIndex.value = (currentIndex.value + 1) % imageFadeIn.length;
      // await Future.delayed(Duration(milliseconds: 500));
      opacity.value = 1.0; // Start fade-in
    }
  }

  void initializeAutoSlide() {
    Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      opacity.value = 0.0; // Start fade-out
      startAutoSlide();
    });
  }

  @override
  void onClose() {
    timer?.cancel();
  }
}
