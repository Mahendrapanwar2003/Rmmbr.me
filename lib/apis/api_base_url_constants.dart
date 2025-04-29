class ApiUrlConstants {
  static const String baseUrlMain = 'http://157.173.222.27:3001';
  static const String baseUrl = '$baseUrlMain/api/v1';
  static const String baseUrlForGetMethodParams = '157.173.222.27:3001';
  static const String endPointOfSignup = '$baseUrl/user/auth/signup';
  static const String endPointOfAddNewMember = '$baseUrl/member/add-new-member';
  static const String endPointOfGetRelationRequests = '$baseUrl/user/get-relation-requests';
  static const String endPointOfConfirmRelation = '$baseUrl/member/confirm-relation';
  static const String endPointOfLogin = '$baseUrl/user/auth/login';
  static const String endPointOfForgotPassword = '$baseUrl/user/forgot-password';
  static const String endPointOfVerifyOtp = '$baseUrl/user/verify-otp';
  static const String endPointOfUpdateProfile = '$baseUrl/user/update-profile';
  static const String endPointOfAddPost = '$baseUrl/post/add-post';
}
