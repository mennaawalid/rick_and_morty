import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CharactersWebServices {
  static Future<Map<String, dynamic>> getAllCharactersAndPagesInfo(
      String url) async {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000, //20 seconds
    );
    Dio dio = Dio(options);

    try {
      Response response = await dio.get(url);
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
