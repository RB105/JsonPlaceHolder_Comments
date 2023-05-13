import 'package:dio/dio.dart';

class DioConfig {
  static Dio createRequest() {
    Dio dio = Dio(BaseOptions(
        validateStatus: (int? status) {
          if (status != null) {
            if (status < 599 && status > 99) {
              return true;
            } else {
              return false;
            }
          } else {
            return false;
          }
        },
        receiveDataWhenStatusError: true));

    // time configration
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 5);
    dio.options.sendTimeout = const Duration(seconds: 5);

    return dio;
  }
}
