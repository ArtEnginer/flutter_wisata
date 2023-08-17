import 'package:apk_ow_guci/network/base_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MakananRepository {
  static Future<dynamic> getMakananAll() async {
    Dio dio = Dio();
    dio.options.baseUrl = BaseApi().getApiUrl();
    try {
      final response = await dio.get('makanan');
      if (kDebugMode) {
        print(response.data);
      }
      return response.data;
    } on DioError catch (e) {
      throw e.response?.data['messages']['error'];
    }
  }
}
