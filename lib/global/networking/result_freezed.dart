import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/global/networking/failure.dart';
part 'result_freezed.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T value) = Success<T>;
  const factory Result.failure(Failure error) = FailureResult<T>;
}
