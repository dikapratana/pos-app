import 'package:dio/dio.dart';
import 'api_exception.dart';
import 'dio_interceptor.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  late final Dio dio;

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.yourdomain.com/v1',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(AppInterceptor());
  }

  // Request GET
  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    try {
      return await dio.get(path, queryParameters: query);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Request POST
  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await dio.post(path, data: data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Request PUT
  Future<Response> put(String path, {dynamic data}) async {
    try {
      return await dio.put(path, data: data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Request DELETE
  Future<Response> delete(String path, {dynamic data}) async {
    try {
      return await dio.delete(path, data: data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  ApiException _handleError(DioException e) {
    String message = 'Terjadi kesalahan';

    if (e.response != null) {
      message = e.response?.data['message'] ?? message;
    } else if (e.type == DioExceptionType.connectionTimeout) {
      message = 'Koneksi timeout';
    } else if (e.type == DioExceptionType.connectionError) {
      message = 'Tidak dapat terhubung ke server';
    }

    return ApiException(
      message,
      statusCode: e.response?.statusCode,
      data: e.response?.data,
    );
  }
}
