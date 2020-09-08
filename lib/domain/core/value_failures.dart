import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.unexpectedError(T valor) = UnexpectedError;
  const factory ValueFailure.nonDegreeValue(T valor) = NonDegreeValue;
}
