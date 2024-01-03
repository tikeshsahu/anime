


import 'package:dio/dio.dart';
import 'package:fox_anime/utils/app_constants.dart';

class DioConfig {
  DioConfig._();

  static final instance = DioConfig._();

  // PrettyDioLogger prettyDioLogger() {
  //   return PrettyDioLogger(
  //     requestHeader: true,
  //     requestBody: true,
  //     responseBody: true,
  //     responseHeader: false,
  //     error: true,
  //     compact: true,
  //     maxWidth: 90,
  //   );
  // }

  BaseOptions options = BaseOptions(
    connectTimeout: AppConstants.connectionTimeout,
    receiveTimeout: AppConstants.receiveTimeout,
    responseType: ResponseType.json,
  );

  Dio dio = Dio();

  Dio getInstance() {
    // dio.interceptors.add(prettyDioLogger());
    dio.interceptors.add(QueuedInterceptorsWrapper(onRequest: (options, handler) {
      // options.headers["x-access-token"] = StorageService.instance.fetch(AppConstants.jwtToken);
      return handler.next(options);
    }));
    dio.options = options;
    return dio;
  }
}