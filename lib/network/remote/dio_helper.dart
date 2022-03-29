import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://car-care3.herokuapp.com/',
        receiveDataWhenStatusError: true,
      headers: {'Content-Type': 'application/json'}
    )
    );
  }

  static Future<Response> getData({
    required String url,
     Map<String, dynamic>? query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    //String lang ='ar',
    String? token,
  }) async {
    dio.options.headers ={
      'Content-Type': 'application/json',
      //'lang': lang,
      'x-auth-token' : token??'',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

}
