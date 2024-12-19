class ApiClient {
  final String baseUrl = 'http://13.214.207.172:8000/';
  String getFullUrl(String endpoint) {
    return baseUrl.endsWith('/') ? '$baseUrl$endpoint' : '$baseUrl/$endpoint';
    // return '$baseUrl/$endpoint';
  }
}

class Endipoint {
  final String login = 'api/v1/login/';
  final String register = '/api/v1/register/';
  final String otp = '/api/v1/verify-otp/';
  final String listRequest = '/api/v1/list-request-blood/';
  final String listDonated = '/api/v1/list-donation-blood/';
  final String requestBlood = '/api/v1/request-blood/';
}
