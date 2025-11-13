import 'dart:convert';
import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  final String? token;

  AppInterceptor({this.token});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Parse JSON jika dikirim dalam bentuk string
    if (response.data is String &&
        response.headers.value('content-type')?.contains('application/json') ==
            true) {
      try {
        response.data = json.decode(response.data);
      } catch (_) {}
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err); // biarkan error diteruskan ke _handleError
  }
}
