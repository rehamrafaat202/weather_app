//https://www.metaweather.com/api/location/search/?query=cairo

import 'package:dio/dio.dart';

class DioHelper
{
  static Dio? dio;
  static void init()
  {
    dio =Dio(
      BaseOptions(
        baseUrl: "https://www.metaweather.com/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
  required Map<String,dynamic> query,
    required String url,
})async
  {
    return await dio!.get(url,queryParameters: query);
  }
}