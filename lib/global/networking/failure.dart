// Failure Classes
import 'package:easy_localization/easy_localization.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerError extends Failure {
  ServerError(super.message);
}

class UnKnownFailure extends Failure {
  UnKnownFailure({int? code})
      : super("Error, Try again later".tr() +
            (code != null ? ' Code: $code' : ''));
}

class ServerFailure extends Failure {
  @override
  final String message;

  ServerFailure(this.message) : super(message);
}

class SessionExpired extends Failure {
  SessionExpired() : super("session_expired".tr());
}

class UnActiveAccount extends Failure {
  UnActiveAccount() : super("verify_your_account_from_email".tr());
}

class NetworkFailure extends Failure {
  NetworkFailure() : super("no_network_connection".tr());
}

class PermissionFailure extends Failure {
  PermissionFailure() : super("edit_your_permission_settings".tr());
}

class BackendMessage extends Failure {
  BackendMessage(super.message);
}

class EmptyData extends Failure {
  EmptyData() : super("no_data_available".tr());
}

// HTTP Status Code Failures
class BadRequest extends Failure {
  final Map<String, dynamic>? errors;
  BadRequest({this.errors}) : super("please_check_your_input".tr());
}

class ValidationInputError extends Failure {
  
  final Map<String, dynamic>? errors;
  ValidationInputError({this.errors}) : super("validation_input_error".tr());
}

class Unauthorized extends Failure {
  Unauthorized() : super("unauthorized_please_try_again".tr());
}

class Forbidden extends Failure {
  Forbidden() : super("access_forbidden".tr());
}

class NotFound extends Failure {
  NotFound() : super("resource_not_found".tr());
}

class Conflict extends Failure {
  Conflict() : super("You_already_rated_this_entity".tr());
}

class TooManyRequests extends Failure {
  TooManyRequests() : super("too_many_requests".tr());
}

class InternalServerError extends Failure {
  InternalServerError() : super("internal_server_error".tr());
}

class BadGateway extends Failure {
  BadGateway() : super("bad_gateway".tr());
}

class ServiceUnavailable extends Failure {
  ServiceUnavailable() : super("service_unavailable".tr());
}

class GatewayTimeout extends Failure {
  GatewayTimeout() : super("gateway_timeout".tr());
}
