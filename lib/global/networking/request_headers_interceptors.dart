import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class RequestHeadersInterceptors extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final appState = getIt<AppStateModel>();
    if (appState.userToken != null) {
      options.headers['Authorization'] = 'Bearer ${appState.userToken}';
      debugPrint(appState.userToken);
    }

    options.headers['X-Authorization'] =
        'AIOEnOSLmuellmwKzSPfG794LCfT4cskhTgi9KS1RhsmkkCGwMD6FtRI1eXUKCS9';
    // options.headers['Entity-Type'] = appState.entityType;
    // options.headers['lang'] = appState.locale.languageCode;
    debugPrint('appState.locale ${appState.locale.languageCode}');
    return handler.next(options);
  }
}
