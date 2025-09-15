import 'package:dio/dio.dart';

class DioClient {
  Dio getDio() {
    late Dio dio;

    dio = Dio(BaseOptions(
      connectTimeout: const Duration(minutes: 2),
      receiveTimeout: const Duration(minutes: 2),
      sendTimeout: const Duration(minutes: 2),
    ))
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true))
      ..interceptors
          .add(InterceptorsWrapper(onRequest: (options, handler) async {
        options.headers['x-api-key'] = 'reqres-free-v1';

        return handler.next(options);
      }));

    return dio;
  }
}
