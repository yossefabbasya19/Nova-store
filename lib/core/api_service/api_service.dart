import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_service/api_constant/api_constant.dart';

abstract class ApiService {
  static Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));

  static Future post(String endPoint, Map<String, dynamic> data,
      {String? token}) async {
    Response response = await dio.post(endPoint,
        data: data,
        options: Options(headers: {
          "Content-Type": "application/json",
          "token": "$token",
        }));
    return response.data;
  }
  static Future delete(String endPoint,
      {Map<String, dynamic>? data,String? token}) async {
    Response response = await dio.delete(endPoint,
        data: data,
        options: Options(headers: {
          "Content-Type": "application/json",
          "token": "$token",
        }));
    return response.data;
  }

  static Future put(String endPoint, Map<String, dynamic> data,
      {String? token}) async {
    Response response = await dio.put(endPoint,
        data: data,
        options: Options(headers: {
          "Content-Type": "application/json",
          "token": "$token",
        }));
    return response.data;
  }

  static Future get(String endPoint,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,String? token}) async {
    Response response = await dio.get(endPoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: {
          "Content-Type": "application/json",
          "token": "$token",
        }));
    return response.data;
  }
}
