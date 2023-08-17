import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisata/network/base_api.dart';

class AuthRepository {
  static Future<dynamic> loginAttempt({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> formData = {'email': email, 'password': password};
    Dio dio = Dio();
    dio.options.baseUrl = BaseApi().getAuthUrl();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      final response = await dio.post('login', data: formData);
      if (kDebugMode) {
        print(response.data);
      }
      return response.data;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.requestOptions.headers);
      }
      throw e.response?.data['messages']['error'] ??
          e.response?.data['messages'];
    }
  }

  static Future<bool> login(String token) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final success = await prefs.setString('token', token);
      if (success) {
        return true;
      }
    } catch (e) {
      throw e.toString();
    }
    return false;
  }

  static Future<bool> logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final success = await prefs.remove('token');
      if (success) {
        return true;
      }
    } catch (e) {
      throw e.toString();
    }
    return false;
  }
}
