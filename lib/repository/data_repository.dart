import 'dart:io';

import 'package:apk_ow_guci/network/base_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class DataRepository {
  static Future<dynamic> getInfografis() async {
    Dio dio = Dio();
    dio.options.baseUrl = BaseApi().getApiUrl();
    try {
      final response = await dio.get('infografis');
      if (kDebugMode) {
        print(response.data);
      }
      return response.data;
    } on DioError catch (e) {
      throw e.response?.data['messages']['error'];
    }
  }

  static Future<dynamic> save(
    String endpoint, {
    String? token,
    int? id,
    String? nama,
    int? harga,
    XFile? gambar,
  }) async {
    final formData = FormData.fromMap({
      'nama': nama,
      'harga': harga,
      "gambar": gambar != null
          ? MultipartFile.fromBytes(
              await gambar.readAsBytes(),
              filename: gambar.name,
              contentType: MediaType("image", "jpeg"), //important
            )
          : null,
    });

    Dio dio = Dio();
    dio.options.baseUrl = BaseApi().getRestUrl();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    dio.options.headers["Authorization"] = token == null ? '' : "Bearer $token";
    try {
      final response = await dio.post(
        id == null ? endpoint : '$endpoint/$id',
        data: formData,
      );
      if (kDebugMode) {
        print(response.data);
      }
      return response.data;
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }

  static Future<dynamic> delete(
    String endpoint, {
    required String token,
    required int id,
  }) async {
    Dio dio = Dio();
    dio.options.baseUrl = BaseApi().getRestUrl();
    dio.options.headers["Authorization"] = "Bearer $token";
    try {
      final response = await dio.delete('$endpoint/$id');
      if (kDebugMode) {
        print(response.data);
      }
      return response.data;
    } on DioError catch (e) {
      throw e.response?.data['messages']['error'];
    }
  }
}
