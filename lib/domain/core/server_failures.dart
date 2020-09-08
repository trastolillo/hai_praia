import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_failures.freezed.dart';

@freezed
abstract class Failure<T> with _$Failure<T> {
  const factory Failure.serverError(T failure) = _ServerError;
  const factory Failure.localDatabaseError(T failure) = _LocalDatabaseError;
}
