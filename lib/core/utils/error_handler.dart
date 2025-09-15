import 'package:dio/dio.dart';

String onErrorHandler(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return "Timeout occurred while sending or receiving";
    case DioExceptionType.badResponse:
      return "Error Server occurred";
    case DioExceptionType.cancel:
      break;
    case DioExceptionType.unknown:
      return "No Internet Connection";
    case DioExceptionType.badCertificate:
      return "Internal Server Error";
    case DioExceptionType.connectionError:
      return "Connection Error";
    }
  return "Unknown Error";
}
