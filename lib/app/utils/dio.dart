import 'package:dio/dio.dart';
import 'package:sionech_assignment_app/app/utils/constants.dart';

class DioHelper {
  static Dio init() {
    var dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(minutes: 5),
        receiveTimeout: const Duration(minutes: 5),
        followRedirects: false,
        headers: <String, String>{
          'Authorization': ' Bearer $readAccessToken',
          'Content-Type': 'application/json'
        }
      )
    );

    final interceptors = InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        return handler.next(error);
      }
    );

    dio.interceptors.add(interceptors);

    return dio;
  }

  Dio dio = init();
}