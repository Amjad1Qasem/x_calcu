import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:x_calcu/global/networking/request_headers_interceptors.dart';
import 'package:x_calcu/global/networking/result_freezed.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

import '../data/url_api.dart';
import 'failure.dart';

typedef JsonDecoder<T> = T Function(Map<String, dynamic> json);

class DioHelper {
  static late Dio dio;
  static PrettyDioLogger prettyInterceptors = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    request: true,
    error: true,
    compact: false,
    maxWidth: 90,
  );

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: UrlApi.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: true,
        validateStatus: (x) {
          if (x == 403) return true;
          return x! <= 205;
        },
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
        () => HttpClient()..badCertificateCallback = (cert, host, port) => true;
    dio.interceptors.addAll([
      prettyInterceptors,
      RequestHeadersInterceptors(),
    ]);
    initHeaders();
  }

  static void initHeaders() {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  static Future<Result<List<Model>>> getAllModel<Model>({
    required String url,
    JsonDecoder<Model>? fromJson,
    Map<String, dynamic>? body,
    String? method,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      Response<dynamic> response;
      List<Model> objects = [];

      if (method == "GET") {
        response = await dio.get(url, data: body);
      } else {
        response = body == null
            ? await dio.get(url)
            : await dio.post(url, data: body, queryParameters: query);
      }

      for (dynamic d in response.data['data']) {
        var r = fromJson!(d);
        objects.add(r);
      }

      return Result.success(objects);
    } on DioException catch (e) {
      return Result.failure(getDioError(e));
    } catch (e, s) {
      printError("Flutter error");
      printError(s.toString());
      printError(e.toString());
      return Result.failure(UnKnownFailure());
    }
  }

  static Future<Result<T>> getModel<T>(
    String url,
    JsonDecoder<T>? fromJson, {
    String? token,
    Object? data,
  }) async {
    return errorHandling(
      () async {
        return await dio.get(url, data: data);
      },
      fromJson: fromJson,
    );
  }

  static Future<Result<T>> postModel<T>(
    String url,
    dynamic obj, {
    JsonDecoder<T>? fromJson,
    String? token,
    Map<String, dynamic>? customHeaders,
    Options? options, // New options parameter
  }) async {
    return errorHandling(
      () async {
        // Merge headers from different sources
        final headers = <String, dynamic>{};

        // 1. Add authorization header
        if (token != null) {
          headers['Authorization'] = 'Bearer $token';
        }

        // 2. Add custom headers
        if (customHeaders != null) {
          headers.addAll(customHeaders);
        }

        // 3. Add headers from options (if any)
        if (options?.headers != null) {
          headers.addAll(options!.headers!);
        }

        // Create merged options
        final mergedOptions = (options ?? Options()).copyWith(
          headers: headers,
        );

        // Make the request with merged options
        return await dio.post(
          url,
          data: obj,
          options: mergedOptions,
        );
      },
      fromJson: fromJson,
    );
  }

  static Future<Result<List<Model>>> postAllModel<Model>({
    required String url,
    required dynamic body,
    JsonDecoder<Model>? fromJson,
    Map<String, dynamic>? query,
    String? token,
    Map<String, dynamic>? customHeaders,
    Options? options,
  }) async {
    try {
      final headers = <String, dynamic>{};

      if (customHeaders != null) {
        headers.addAll(customHeaders);
      }

      if (options?.headers != null) {
        headers.addAll(options!.headers!);
      }

      final mergedOptions = (options ?? Options()).copyWith(
        headers: headers,
      );

      final response = await dio.post(
        url,
        data: body,
        queryParameters: query,
        options: mergedOptions,
      );

      List<Model> objects = [];
      for (dynamic d in response.data['data']) {
        var r = fromJson!(d);
        objects.add(r);
      }

      return objects.isEmpty
          ? const Result.success([])
          : Result.success(objects);
    } on DioException catch (e) {
      return Result.failure(getDioError(e));
    } catch (e, s) {
      printError("Flutter error");
      printError(s.toString());
      printError(e.toString());
      return Result.failure(UnKnownFailure());
    }
  }

  static Future<Result<T>> patchModel<T>(
    String url,
    dynamic body, {
    JsonDecoder<T>? fromJson,
    String? token,
    Map<String, dynamic>? customHeaders,
    Options? options,
  }) async {
    return errorHandling(
      () async {
        final headers = <String, dynamic>{};

        if (customHeaders != null) {
          headers.addAll(customHeaders);
        }

        if (options?.headers != null) {
          headers.addAll(options!.headers!);
        }

        final mergedOptions = (options ?? Options()).copyWith(
          headers: headers,
        );

        return await dio.patch(
          url,
          data: body,
          options: mergedOptions,
        );
      },
      fromJson: fromJson,
    );
  }

  static Future<Result<bool>> putModel(
      {required String url, required dynamic body}) async {
    return errorHandling(() async => await dio.put(url, data: body));
  }

  static Future<Result<bool>> deleteModel(
      {required String url, required dynamic body}) async {
    return errorHandling(() async => await dio.delete(url, data: body));
  }

  static Future<Result<T>> errorHandling<T>(
    Future<Response<dynamic>> Function() request, {
    JsonDecoder<T>? fromJson,
    bool? postData,
  }) async {
    try {
      Response<dynamic> response = await request();

      if (postData == true) {
        return Result.success(response.data['data']);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (fromJson != null && response.data is Map<String, dynamic>) {
          return Result.success(fromJson(response.data["data"]));
        }
        if (T == bool) {
          return Result.success(
              true as T); // Return true for successful operations
        }
        return Result.success(
            response.data["message"] ?? "Operation successful".tr());
      }

      if (response.data != null) {
        if (response.data["code"] == 403) {
          return Result.failure(SessionExpired());
        }
        if (response.data['code'] == 700) {
          return Result.failure(UnActiveAccount());
        }
        return Result.failure(ServerError(
            response.data["message"] ?? "Unknown Server Error".tr()));
      }

      return Result.failure(ServerError("unexpected_server_response".tr()));
    } on DioException catch (e) {
      return Result.failure(getDioError(e));
    } catch (e, s) {
      printError("Flutter error");
      printError(s.toString());
      printError(e.toString());
      return Result.failure(UnKnownFailure());
    }
  }

// Dio Exception Handler
  static Failure getDioError(DioException e) {
    debugPrint("Dio error type: ${e.type}");
    debugPrint("Dio error message: ${e.message}");
    debugPrint("Dio error response: ${e.response?.data}");

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure(); // Connection timeout

      case DioExceptionType.sendTimeout:
        return ServerError("Request timed out while sending data.".tr());

      case DioExceptionType.receiveTimeout:
        return ServerError("Request timed out while receiving data.".tr());

      case DioExceptionType.badResponse:
        return handleHttpResponseError(
            e.response?.statusCode ?? 500, e.response?.data);

      case DioExceptionType.cancel:
        return ServerError("Request was cancelled.".tr());

      case DioExceptionType.connectionError:
        return NetworkFailure(); // No internet connection

      case DioExceptionType.unknown:
        if (e.error is SocketException) {
          return NetworkFailure(); // Handle network failure separately
        }
        if (e.error is TlsException) {
          return ServerError(
              "SSL certificate error.".tr()); // Handle SSL/TLS issues
        }
        return UnKnownFailure(
            code: e.response?.statusCode); // Log unknown errors

      default:
        return ServerError("something_went_wrong".tr());
    }
  }

//Handle HTTP Response Errors
  static Failure handleHttpResponseError(int statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return BadRequest(errors: _extractValidationErrors(data));
      case 401:
        return Unauthorized();
      case 422:
        return ValidationInputError(errors: _extractValidationErrors(data));
      case 403:
        return Forbidden();
      case 404:
        return NotFound();
      case 409:
        return Conflict();
      case 429:
        return TooManyRequests();
      case 500:
        return InternalServerError();
      case 502:
        return BadGateway();
      case 503:
        return ServiceUnavailable();
      case 504:
        return GatewayTimeout();
      default:
        return ServerError("something_went_wrong".tr());
      // data != null ? data.toString() : "Unexpected error occurred.".tr());
    }
  }

  static Map<String, dynamic>? _extractValidationErrors(dynamic data) {
    try {
      if (data is Map<String, dynamic> && data.containsKey('errors')) {
        return data['errors'] as Map<String, dynamic>;
      }
    } catch (e) {
      printError("Error extracting validation errors: ".tr() + e.toString());
    }
    return null;
  }
}
