import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../constants/strings.dart';
import '../models/characters.dart';

class CharactersWebServices {
  static Future<Map<String, dynamic>> getAllCharactersAndPagesInfo() async {
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000, //20 seconds
    );
    Dio dio = Dio(options);

    try {
      Response response = await dio.get('character');
      // print(response.data.toString());
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(
          e.toString(),
        );
      }
      return {};
    }
  }
}
