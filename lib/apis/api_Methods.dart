import 'dart:convert';
import 'dart:io';
import '../common/http_methods.dart';
import 'api_base_url_constants.dart';
import 'api_models/user_data_model.dart';
import 'package:http/http.dart' as http;

class ApiMethods {
  static Future<UserDataModel?> signupMethod(
      {File? image, String? imageKey, Map<String, dynamic>? bodyParams}) async {
    http.Response? response = await MyHttp.multipart(
        url: ApiUrlConstants.endPointOfSignup,
        image: image,
        imageKey: imageKey,
        bodyParams: bodyParams);
    if (response != null) {
      return UserDataModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<UserDataModel?> updateProfileMethod(
      {File? image, String? imageKey, Map<String, dynamic>? bodyParams}) async {
    http.Response? response = await MyHttp.multipart(
        url: ApiUrlConstants.endPointOfUpdateProfile,
        image: image,
        imageKey: imageKey,
        bodyParams: bodyParams);
    if (response != null) {
      return UserDataModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<UserDataModel?> loginMethod(
      {File? image, String? imageKey, Map<String, dynamic>? bodyParams}) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfLogin, bodyParams: bodyParams);
    if (response != null) {
      return UserDataModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<UserDataModel?> forgotPasswordMethod(
      {File? image, String? imageKey, Map<String, dynamic>? bodyParams}) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfForgotPassword, bodyParams: bodyParams);
    if (response != null) {
      return UserDataModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<UserDataModel?> verifyOtpMethod(
      {File? image, String? imageKey, Map<String, dynamic>? bodyParams}) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfVerifyOtp, bodyParams: bodyParams);
    if (response != null) {
      return UserDataModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }
}
