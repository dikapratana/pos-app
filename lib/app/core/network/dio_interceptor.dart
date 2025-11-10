import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  final String? token;

  AppInterceptor({this.token});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Tambahkan token otomatis
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // Log request
    print('[DIO] → ${options.method} ${options.uri}');
    if (options.data != null) print('Body: ${options.data}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log response
    print('[DIO] ← [${response.statusCode}] ${response.requestOptions.uri}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message = 'Terjadi kesalahan koneksi';
    if (err.type == DioExceptionType.connectionTimeout) {
      message = 'Koneksi timeout';
    } else if (err.type == DioExceptionType.receiveTimeout) {
      message = 'Server tidak merespon';
    } else if (err.type == DioExceptionType.badResponse) {
      message = err.response?.data['message'] ?? 'Terjadi kesalahan server';
    }

    print('[DIO] ❌ ${err.message}');
    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        message: message,
        type: err.type,
      ),
    );
  }
}
