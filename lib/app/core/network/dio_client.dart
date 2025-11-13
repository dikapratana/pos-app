import 'package:dio/dio.dart';
import '../configs/services/locator.dart';
import '../configs/services/navigation_service.dart';
import '../configs/services/snackbar_service.dart';

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
        validateStatus: (_) => true,
      ),
    );
  }

  // -------------------- HTTP METHODS --------------------
  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    try {
      final response = await dio.get(path, queryParameters: query);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      final response = await dio.post(path, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> put(String path, {dynamic data}) async {
    try {
      final response = await dio.put(path, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> delete(String path, {dynamic data}) async {
    try {
      final response = await dio.delete(path, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // -------------------- RESPONSE HANDLER --------------------
  Response _handleResponse(Response response) {
    final statusCode = response.statusCode ?? 0;
    final data = response.data;

    // ✅ Success
    if (statusCode >= 200 && statusCode < 300) return response;

    // 🧩 Ambil pesan error
    String message = 'Terjadi kesalahan ($statusCode)';
    if (data is Map && data['message'] != null) {
      message = data['message'].toString();
    } else if (data is String && data.isNotEmpty) {
      message = data;
    }

    locator<SnackbarService>().show(message, type: SnackbarType.error);

    // 🚀 Lempar ulang supaya repository tetap bisa tangani
    throw DioException(
      requestOptions: response.requestOptions,
      response: Response(
        requestOptions: response.requestOptions,
        data: {'success': false, 'code': statusCode, 'message': message},
        statusCode: statusCode,
      ),
      type: DioExceptionType.badResponse,
      message: message,
    );
  }

  // -------------------- ERROR HANDLER --------------------
  DioException _handleError(DioException e) {
    int statusCode = e.response?.statusCode ?? 5000;
    String message = 'Terjadi kesalahan';

    if (e.response == null) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          message = 'Koneksi ke server timeout';
          break;
        case DioExceptionType.connectionError:
        case DioExceptionType.unknown:
          message = 'Tidak dapat terhubung ke server';
          break;
        default:
          message = 'Kesalahan tidak diketahui';
      }

      locator<SnackbarService>().show(message, type: SnackbarType.error);
      throw DioException(
        requestOptions: e.requestOptions,
        response: Response(
          requestOptions: e.requestOptions,
          data: {'success': false, 'code': statusCode, 'message': message},
        ),
        type: e.type,
        message: message,
      );
    }

    // Ambil message dari response
    final data = e.response?.data;
    if (data is Map && data['message'] != null) {
      message = data['message'].toString();
    } else if (data is String && data.isNotEmpty) {
      message = data;
    }

    // 🧭 Handle unauthorized global (reusable)
    _handleUnauthorizedIfNeeded(statusCode: statusCode, message: message);

    return DioException(
      requestOptions: e.requestOptions,
      response: Response(
        requestOptions: e.requestOptions,
        data: {'success': false, 'code': statusCode, 'message': message},
        statusCode: statusCode,
      ),
      type: e.type,
      message: message,
    );
  }

  // -------------------- REUSABLE GLOBAL HANDLER --------------------
  void _handleUnauthorizedIfNeeded({int? statusCode, String? message}) {
    if (statusCode != 401 && statusCode != 403) return;

    final nav = locator<NavigationService>();
    final currentRoute = nav.currentRoute;
    final excludedRoutes = ['/login', '/register', '/onboarding', '/splash'];

    if (!excludedRoutes.contains(currentRoute)) {
      locator<SnackbarService>().show(
        'Sesi berakhir, silakan login ulang',
        type: SnackbarType.error,
      );
      nav.clearAndNavigate('/login');
    }

    locator<SnackbarService>().show(message, type: SnackbarType.error);
  }
}
