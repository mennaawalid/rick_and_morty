import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../constants/strings.dart';
import '../models/characters.dart';

class CharactersWebServices {
  static Future<PageInfoAndCharacters> getAllCharactersAndPagesInfo() async {
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000, //20 seconds
    );
    Dio dio = Dio(options);

    try {
      Response response = await dio.get('character');
      var jsondata = json.decode(response.data);
      PageInfoAndCharacters charactersAndPagesInfo =
          PageInfoAndCharacters.fromJson(jsondata);
      return charactersAndPagesInfo;
    } catch (e) {
      if (kDebugMode) {
        print(
          e.toString(),
        );
      }
      return PageInfoAndCharacters.fromJson({});
    }
  }
}
