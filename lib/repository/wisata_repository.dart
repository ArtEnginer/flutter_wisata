import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wisata/network/base_api.dart';

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
