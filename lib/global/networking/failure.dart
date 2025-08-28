// Failure Classes
import 'package:easy_localization/easy_localization.dart';

abstract class Failure {
  final String message;
  final int statusCode;

  Failure(this.message, this.statusCode);
}

class ServerError extends Failure {
  ServerError(String message) : super(message, 500);
}

class BackEndError extends Failure {
  dynamic data;
  BackEndError(String message, this.data) : super(message, 411);
}

class UnKnownFailure extends Failure {
  UnKnownFailure({int? code})
      : super(
          "Error, Try again later".tr() + (code != null ? ' Code: $code' : ''),
          code ?? 520,
        );
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message, 500);
}

class PhoneNotVerified extends Failure {
  PhoneNotVerified(String message)
      : super('Please verify your phone number first', 400);
}

class SessionExpired extends Failure {
  SessionExpired() : super("session_expired".tr(), 401);
}

class UnActiveAccount extends Failure {
  UnActiveAccount() : super("verify_your_account_from_email".tr(), 403);
}

class NetworkFailure extends Failure {
  NetworkFailure() : super("no_network_connection".tr(), 503);
}

class PermissionFailure extends Failure {
  PermissionFailure() : super("edit_your_permission_settings".tr(), 403);
}

class BackendMessage extends Failure {
  BackendMessage(String message, {int statusCode = 400})
      : super(message, statusCode);
}

class EmptyData extends Failure {
  EmptyData() : super("no_data_available".tr(), 204);
}

// HTTP Status Code Failures
class BadRequest extends Failure {
  final Map<String, dynamic>? errors;

  BadRequest({this.errors, String? message})
      : super(
            message != 'Validation error'
                ? message!
                : "please_check_your_input".tr(),
            400);
}

class ValidationInputError extends Failure {
  final Map<String, dynamic>? errors;

  ValidationInputError({this.errors, String? message})
      : super(
            message == 'Validation error'
                ? "validation_input_error".tr()
                : message!,
            422);
}

class Unauthorized extends Failure {
  Unauthorized() : super("unauthorized_please_try_again".tr(), 401);
}

class Forbidden extends Failure {
  Forbidden({String? message}) : super(message ?? "access_forbidden".tr(), 403);
}

class NotFound extends Failure {
  NotFound() : super("resource_not_found".tr(), 404);
}

class Conflict extends Failure {
  final String? phoneNumber;

  Conflict({String? message, this.phoneNumber})
      : super(message ?? "You_already_did_this_action".tr(), 409);
}

class TooManyRequests extends Failure {
  TooManyRequests() : super("too_many_requests".tr(), 429);
}

class InternalServerError extends Failure {
  InternalServerError() : super("internal_server_error".tr(), 500);
}

class BadGateway extends Failure {
  BadGateway() : super("bad_gateway".tr(), 502);
}

class ServiceUnavailable extends Failure {
  ServiceUnavailable() : super("service_unavailable".tr(), 503);
}

class GatewayTimeout extends Failure {
  GatewayTimeout() : super("gateway_timeout".tr(), 504);
}
