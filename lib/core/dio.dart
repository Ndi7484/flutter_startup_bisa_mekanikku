import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioUtils {
  final Dio _dio = Dio();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Dio get dio {
    _setupInterceptors();
    return _dio;
  }

  void _setupInterceptors() async {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          String? accessToken = await _secureStorage.read(key: 'access_token');
          if (accessToken != null) {
            options.headers['Authorization'] = "Bearer $accessToken";
            options.headers['Accept'] = "application/json";
          }

          return handler.next(options);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          print("DioError : ${e.message}");
          if (e.response != null) {
            print("Response data : ${e.response?.data}");
          }
          return handler.next(e);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          if (response.statusCode == 401) {}
          return handler.next(response);
        },
      ),
    );
  }
}
