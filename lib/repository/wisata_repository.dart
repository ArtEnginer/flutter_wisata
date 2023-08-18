import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wisata/network/base_api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

class WisataRepository {
  static Future<dynamic> getWisata({String? query}) async {
    var sendData = {
      'query': query,
    };
    Dio dio = Dio();
    dio.options.baseUrl = BaseApi().getApiUrl();
    try {
      final response = await dio.get('wisata', queryParameters: sendData);
      if (kDebugMode) {
        print(response.data);
      }
      return response.data;
    } on DioError catch (e) {
      throw e.response?.data['messages']['error'];
    }
  }

  static Future<dynamic> save({
    String? token,
    int? id,
    String? nama,
    String? deskripsi,
    int? harga,
    XFile? image,
    String? gambar,
  }) async {
    final formData = FormData.fromMap({
      'nama': nama,
      'deskripsi': deskripsi,
      'htm': harga,
      "gambar": image != null
          ? MultipartFile.fromBytes(
              await image.readAsBytes(),
              filename: image.name,
              contentType: MediaType("image", "jpeg"), //important
            )
          : gambar,
    });

    Dio dio = Dio();
    dio.options.baseUrl = BaseApi().getRestUrl();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    dio.options.headers["Authorization"] = token == null ? '' : "Bearer $token";
    try {
      final response = await dio.post(
        id == null ? "wisata" : 'wisata/$id',
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

  static Future<dynamic> delete({
    required String token,
    required int id,
  }) async {
    Dio dio = Dio();
    dio.options.baseUrl = BaseApi().getRestUrl();
    dio.options.headers["Authorization"] = "Bearer $token";
    try {
      final response = await dio.delete('wisata/$id');
      if (kDebugMode) {
        print(response.data);
      }
      return response.data;
    } on DioError catch (e) {
      throw e.response?.data['messages']['error'];
    }
  }
}
