import 'package:dio/dio.dart';
import 'package:news_app/core/networking/api_constants.dart';

class ApiServices {
  late Dio dio;

  ApiServices() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.base_url,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    return await dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: Options(
        headers: {if (token != null) "Authorization": "Bearer $token"},
      ),
    );
  }

  Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    return await dio.post(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: {if (token != null) "Authorization": "Bearer $token"},
      ),
    );
  }

  // ✅ PUT Request
  Future<Response> put({
    required String endPoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    return await dio.put(
      endPoint,
      data: data,
      options: Options(
        headers: {if (token != null) "Authorization": "Bearer $token"},
      ),
    );
  }

  // ✅ DELETE Request
  Future<Response> delete({
    required String endPoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    return await dio.delete(
      endPoint,
      data: data,
      options: Options(
        headers: {if (token != null) "Authorization": "Bearer $token"},
      ),
    );
  }
}
