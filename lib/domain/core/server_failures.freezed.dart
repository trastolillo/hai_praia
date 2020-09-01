// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'server_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ServerFailureTearOff {
  const _$ServerFailureTearOff();

// ignore: unused_element
  _ServerError<T> serverError<T>(T failure) {
    return _ServerError<T>(
      failure,
    );
  }
}

// ignore: unused_element
const $ServerFailure = _$ServerFailureTearOff();

mixin _$ServerFailure<T> {
  T get failure;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(T failure),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(T failure),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(_ServerError<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(_ServerError<T> value),
    @required Result orElse(),
  });

  $ServerFailureCopyWith<T, ServerFailure<T>> get copyWith;
}

abstract class $ServerFailureCopyWith<T, $Res> {
  factory $ServerFailureCopyWith(
          ServerFailure<T> value, $Res Function(ServerFailure<T>) then) =
      _$ServerFailureCopyWithImpl<T, $Res>;
  $Res call({T failure});
}

class _$ServerFailureCopyWithImpl<T, $Res>
    implements $ServerFailureCopyWith<T, $Res> {
  _$ServerFailureCopyWithImpl(this._value, this._then);

  final ServerFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ServerFailure<T>) _then;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_value.copyWith(
      failure: failure == freezed ? _value.failure : failure as T,
    ));
  }
}

abstract class _$ServerErrorCopyWith<T, $Res>
    implements $ServerFailureCopyWith<T, $Res> {
  factory _$ServerErrorCopyWith(
          _ServerError<T> value, $Res Function(_ServerError<T>) then) =
      __$ServerErrorCopyWithImpl<T, $Res>;
  @override
  $Res call({T failure});
}

class __$ServerErrorCopyWithImpl<T, $Res>
    extends _$ServerFailureCopyWithImpl<T, $Res>
    implements _$ServerErrorCopyWith<T, $Res> {
  __$ServerErrorCopyWithImpl(
      _ServerError<T> _value, $Res Function(_ServerError<T>) _then)
      : super(_value, (v) => _then(v as _ServerError<T>));

  @override
  _ServerError<T> get _value => super._value as _ServerError<T>;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_ServerError<T>(
      failure == freezed ? _value.failure : failure as T,
    ));
  }
}

class _$_ServerError<T> implements _ServerError<T> {
  const _$_ServerError(this.failure) : assert(failure != null);

  @override
  final T failure;

  @override
  String toString() {
    return 'ServerFailure<$T>.serverError(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServerError<T> &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  _$ServerErrorCopyWith<T, _ServerError<T>> get copyWith =>
      __$ServerErrorCopyWithImpl<T, _ServerError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(T failure),
  }) {
    assert(serverError != null);
    return serverError(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(T failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(_ServerError<T> value),
  }) {
    assert(serverError != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(_ServerError<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError<T> implements ServerFailure<T> {
  const factory _ServerError(T failure) = _$_ServerError<T>;

  @override
  T get failure;
  @override
  _$ServerErrorCopyWith<T, _ServerError<T>> get copyWith;
}
