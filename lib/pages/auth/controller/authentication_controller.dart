import 'package:blood_donation_mobile/pages/auth/model/login_model.dart';
import 'package:blood_donation_mobile/pages/auth/model/otp_model';
import 'package:blood_donation_mobile/pages/auth/model/register_model.dart';
import 'package:blood_donation_mobile/repository/api_service.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  RxBool isLoginSelected = true.obs;

  final ApiService _apiService = ApiService();
  var loginModel = Rxn<LoginModel>();
  var registerModel = Rxn<RegisterModel>();
  var otpModel = Rxn<OtpModel>();

  Future<void> login(String phone, String password) async {
    final result = await _apiService.login(phone, password);
    try {
      if (result != null) {
        loginModel(result);
      } else {
        print("fail to login");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> register(String firstName, String lastName, String phonenumber,
      String password, String confirmpassword) async {
    try {
      final result = await _apiService.register(
          firstName, lastName, confirmpassword, phonenumber, password);
      registerModel.value = result;
    } catch (e) {
      print("Error during registration: $e");
    }
  }

  Future<void> verifyOTP(String phonenumber, String otp) async {
    try {
      final result = await _apiService.verifyOTP(phonenumber, otp);
      otpModel.value = result;
    } catch (e) {
      print("Error during registration: $e");
    }
  }
}
