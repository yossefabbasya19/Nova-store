import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_service/api_constant/api_constant.dart';

abstract class ApiService {
  static Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));

  static Future post(String endPoint, Map<String, dynamic> data) async {
    Response response = await dio.post(endPoint, data: data);
    return response.data;
  }

  static Future get(String endPoint,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    Response response =
        await dio.get(endPoint, data: data, queryParameters: queryParameters);
    return response.data;
  }
}
