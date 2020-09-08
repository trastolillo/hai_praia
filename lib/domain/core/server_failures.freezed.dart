// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'server_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FailureTearOff {
  const _$FailureTearOff();

// ignore: unused_element
  _ServerError<T> serverError<T>(T failure) {
    return _ServerError<T>(
      failure,
    );
  }

// ignore: unused_element
  _LocalDatabaseError<T> localDatabaseError<T>(T failure) {
    return _LocalDatabaseError<T>(
      failure,
    );
  }
}

// ignore: unused_element
const $Failure = _$FailureTearOff();

mixin _$Failure<T> {
  T get failure;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(T failure),
    @required Result localDatabaseError(T failure),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(T failure),
    Result localDatabaseError(T failure),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(_ServerError<T> value),
    @required Result localDatabaseError(_LocalDatabaseError<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(_ServerError<T> value),
    Result localDatabaseError(_LocalDatabaseError<T> value),
    @required Result orElse(),
  });

  $FailureCopyWith<T, Failure<T>> get copyWith;
}

abstract class $FailureCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) then) =
      _$FailureCopyWithImpl<T, $Res>;
  $Res call({T failure});
}

class _$FailureCopyWithImpl<T, $Res> implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  final Failure<T> _value;
  // ignore: unused_field
  final $Res Function(Failure<T>) _then;

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
    implements $FailureCopyWith<T, $Res> {
  factory _$ServerErrorCopyWith(
          _ServerError<T> value, $Res Function(_ServerError<T>) then) =
      __$ServerErrorCopyWithImpl<T, $Res>;
  @override
  $Res call({T failure});
}

class __$ServerErrorCopyWithImpl<T, $Res> extends _$FailureCopyWithImpl<T, $Res>
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
    return 'Failure<$T>.serverError(failure: $failure)';
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
    @required Result localDatabaseError(T failure),
  }) {
    assert(serverError != null);
    assert(localDatabaseError != null);
    return serverError(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(T failure),
    Result localDatabaseError(T failure),
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
    @required Result localDatabaseError(_LocalDatabaseError<T> value),
  }) {
    assert(serverError != null);
    assert(localDatabaseError != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(_ServerError<T> value),
    Result localDatabaseError(_LocalDatabaseError<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError<T> implements Failure<T> {
  const factory _ServerError(T failure) = _$_ServerError<T>;

  @override
  T get failure;
  @override
  _$ServerErrorCopyWith<T, _ServerError<T>> get copyWith;
}

abstract class _$LocalDatabaseErrorCopyWith<T, $Res>
    implements $FailureCopyWith<T, $Res> {
  factory _$LocalDatabaseErrorCopyWith(_LocalDatabaseError<T> value,
          $Res Function(_LocalDatabaseError<T>) then) =
      __$LocalDatabaseErrorCopyWithImpl<T, $Res>;
  @override
  $Res call({T failure});
}

class __$LocalDatabaseErrorCopyWithImpl<T, $Res>
    extends _$FailureCopyWithImpl<T, $Res>
    implements _$LocalDatabaseErrorCopyWith<T, $Res> {
  __$LocalDatabaseErrorCopyWithImpl(_LocalDatabaseError<T> _value,
      $Res Function(_LocalDatabaseError<T>) _then)
      : super(_value, (v) => _then(v as _LocalDatabaseError<T>));

  @override
  _LocalDatabaseError<T> get _value => super._value as _LocalDatabaseError<T>;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_LocalDatabaseError<T>(
      failure == freezed ? _value.failure : failure as T,
    ));
  }
}

class _$_LocalDatabaseError<T> implements _LocalDatabaseError<T> {
  const _$_LocalDatabaseError(this.failure) : assert(failure != null);

  @override
  final T failure;

  @override
  String toString() {
    return 'Failure<$T>.localDatabaseError(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocalDatabaseError<T> &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  _$LocalDatabaseErrorCopyWith<T, _LocalDatabaseError<T>> get copyWith =>
      __$LocalDatabaseErrorCopyWithImpl<T, _LocalDatabaseError<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(T failure),
    @required Result localDatabaseError(T failure),
  }) {
    assert(serverError != null);
    assert(localDatabaseError != null);
    return localDatabaseError(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(T failure),
    Result localDatabaseError(T failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (localDatabaseError != null) {
      return localDatabaseError(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(_ServerError<T> value),
    @required Result localDatabaseError(_LocalDatabaseError<T> value),
  }) {
    assert(serverError != null);
    assert(localDatabaseError != null);
    return localDatabaseError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(_ServerError<T> value),
    Result localDatabaseError(_LocalDatabaseError<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (localDatabaseError != null) {
      return localDatabaseError(this);
    }
    return orElse();
  }
}

abstract class _LocalDatabaseError<T> implements Failure<T> {
  const factory _LocalDatabaseError(T failure) = _$_LocalDatabaseError<T>;

  @override
  T get failure;
  @override
  _$LocalDatabaseErrorCopyWith<T, _LocalDatabaseError<T>> get copyWith;
}
