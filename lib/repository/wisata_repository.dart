import 'package:apk_ow_guci/network/base_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class WisataRepository {
  static Future<dynamic> getWisataAll() async {
    Dio dio = Dio();
    dio.options.baseUrl = BaseApi().getApiUrl();
    try {
      final response = await dio.get('wisata');
      if (kDebugMode) {
        print(response.data);
      }
      return response.data;
    } on DioError catch (e) {
      throw e.response?.data['messages']['error'];
    }
  }
}
