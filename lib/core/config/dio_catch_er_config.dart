import 'package:dio/dio.dart';

class DioCatchError {
  static String catchError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return "Connection Timeout";
      case DioErrorType.sendTimeout:
        return "Send Timeout";
      case DioErrorType.receiveTimeout:
        return "Receive Timeout";
      default:
        return "No Internet Connection";
    }
  }
}
