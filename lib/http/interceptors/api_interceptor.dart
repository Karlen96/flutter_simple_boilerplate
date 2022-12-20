import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (options.data is Map) {
      /// Remove nulls from request body [options.data].
      (options.data as Map<dynamic, dynamic>).removeWhere(
        (k, v) => v == null || k == 'runtimeType',
      );
    }

    /// Remove nulls from header.
    options.headers.removeWhere(
      (key, value) => value == null,
    );

    return handler.next(options);
  }
}
