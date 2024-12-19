import 'package:blood_donation_mobile/pages/auth/model/login_model.dart';
import 'package:blood_donation_mobile/pages/auth/model/otp_model';
import 'package:blood_donation_mobile/pages/auth/model/register_model.dart';
import 'package:blood_donation_mobile/pages/model/blood_donation_model.dart';
import 'package:blood_donation_mobile/pages/model/request_blood_model.dart';
import 'package:blood_donation_mobile/repository/api_client.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
// {"phone": "+85512221158", "password": "panha1234"}
  final ApiClient _apiClient = ApiClient();

  Future<LoginModel?> login(String phonenumber, String password) async {
    try {
      String url = _apiClient.getFullUrl(Endipoint().login);

      Response response = await _dio
          .post(url, data: {"phone": phonenumber, "password": password});

      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      } else {
        throw Exception("Failed to Login");
      }
    } catch (e) {
      print('Error login: $e'); // Log the error
      rethrow;
    }
  }

  Future<RegisterModel> register(String firstName, String lastName,
      String confirmpassword, String phonenumber, String password) async {
    try {
      String url = _apiClient.getFullUrl(Endipoint().register);

      Response response = await _dio.post(url, data: {
        "first_name": firstName,
        "last_name": lastName,
        "phone": phonenumber,
        "password": password,
        "confirm_password": confirmpassword
      });
      if (response.statusCode == 200) {
        return RegisterModel.fromJson(response.data);
      } else {
        throw Exception("Failed to Register");
      }
    } on DioException catch (e) {
      print('Error register: ${e.message}');
      print('DioError details: ${e.response?.data}');
      rethrow;
    } catch (e) {
      print('Unexpected error: $e');
      rethrow;
    }
  }

  Future<OtpModel> verifyOTP(String phonenumber, String otp) async {
    try {
      String url = _apiClient.getFullUrl(Endipoint().otp);

      Response response = await _dio.post(url, data: {
        "phone": phonenumber,
        "otp": otp,
      });
      if (response.statusCode == 201) {
        return OtpModel.fromJson(response.data);
      } else {
        throw Exception("Failed to verify OTP");
      }
    } on DioException catch (e) {
      print('Error register: ${e.message}');
      print('DioError details: ${e.response?.data}');
      rethrow;
    } catch (e) {
      print('Unexpected error: $e');
      rethrow;
    }
  }

  Future<List<RequestBloodModel>> fetchRequestBlood(
      {required String token}) async {
    try {
      String url = _apiClient.getFullUrl(Endipoint().listRequest);

      Response response = await _dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode == 200) {
        return List<RequestBloodModel>.from(
            response.data.map((x) => RequestBloodModel.fromJson(x)));
      } else {
        throw Exception("Failed to fetch data");
      }
    } on DioException catch (e) {
      print('Error fetching request blood:  ${e.message}');
      print('DioError details: ${e.response?.data}');
      rethrow;
    } catch (e) {
      print('Unexpected error: $e');
      rethrow;
    }
  }

  Future<List<BloodDonationModel>> fetchBloodDonted(
      {required String token}) async {
    try {
      String url = _apiClient.getFullUrl(Endipoint().listDonated);

      Response response = await _dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode == 200) {
        return List<BloodDonationModel>.from(
            response.data.map((x) => BloodDonationModel.fromJson(x)));
      } else {
        throw Exception("failed to fetch data");
      }
    } on DioException catch (e) {
      print('Error fetching blood donation: ${e.message}');
      print('DioError details: ${e.response?.data}');
      rethrow;
    } catch (e) {
      print('Unexpected error: $e');
      rethrow;
    }
  }
}
