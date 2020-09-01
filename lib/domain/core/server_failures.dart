import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_failures.freezed.dart';

@freezed
abstract class ServerFailure<T> with _$ServerFailure<T> {
  const factory ServerFailure.serverError(T failure) = _ServerError;
}
