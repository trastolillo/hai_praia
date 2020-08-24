// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

// ignore: unused_element
  UnexpectedError<T> unexpectedError<T>(T valor) {
    return UnexpectedError<T>(
      valor,
    );
  }

// ignore: unused_element
  NonDegreeValue<T> nonDegreeValue<T>(T valor) {
    return NonDegreeValue<T>(
      valor,
    );
  }
}

// ignore: unused_element
const $ValueFailure = _$ValueFailureTearOff();

mixin _$ValueFailure<T> {
  T get valor;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpectedError(T valor),
    @required Result nonDegreeValue(T valor),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpectedError(T valor),
    Result nonDegreeValue(T valor),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpectedError(UnexpectedError<T> value),
    @required Result nonDegreeValue(NonDegreeValue<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpectedError(UnexpectedError<T> value),
    Result nonDegreeValue(NonDegreeValue<T> value),
    @required Result orElse(),
  });

  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith;
}

abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
  $Res call({T valor});
}

class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;

  @override
  $Res call({
    Object valor = freezed,
  }) {
    return _then(_value.copyWith(
      valor: valor == freezed ? _value.valor : valor as T,
    ));
  }
}

abstract class $UnexpectedErrorCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $UnexpectedErrorCopyWith(
          UnexpectedError<T> value, $Res Function(UnexpectedError<T>) then) =
      _$UnexpectedErrorCopyWithImpl<T, $Res>;
  @override
  $Res call({T valor});
}

class _$UnexpectedErrorCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $UnexpectedErrorCopyWith<T, $Res> {
  _$UnexpectedErrorCopyWithImpl(
      UnexpectedError<T> _value, $Res Function(UnexpectedError<T>) _then)
      : super(_value, (v) => _then(v as UnexpectedError<T>));

  @override
  UnexpectedError<T> get _value => super._value as UnexpectedError<T>;

  @override
  $Res call({
    Object valor = freezed,
  }) {
    return _then(UnexpectedError<T>(
      valor == freezed ? _value.valor : valor as T,
    ));
  }
}

class _$UnexpectedError<T> implements UnexpectedError<T> {
  const _$UnexpectedError(this.valor) : assert(valor != null);

  @override
  final T valor;

  @override
  String toString() {
    return 'ValueFailure<$T>.unexpectedError(valor: $valor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UnexpectedError<T> &&
            (identical(other.valor, valor) ||
                const DeepCollectionEquality().equals(other.valor, valor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(valor);

  @override
  $UnexpectedErrorCopyWith<T, UnexpectedError<T>> get copyWith =>
      _$UnexpectedErrorCopyWithImpl<T, UnexpectedError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpectedError(T valor),
    @required Result nonDegreeValue(T valor),
  }) {
    assert(unexpectedError != null);
    assert(nonDegreeValue != null);
    return unexpectedError(valor);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpectedError(T valor),
    Result nonDegreeValue(T valor),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpectedError != null) {
      return unexpectedError(valor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpectedError(UnexpectedError<T> value),
    @required Result nonDegreeValue(NonDegreeValue<T> value),
  }) {
    assert(unexpectedError != null);
    assert(nonDegreeValue != null);
    return unexpectedError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpectedError(UnexpectedError<T> value),
    Result nonDegreeValue(NonDegreeValue<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpectedError != null) {
      return unexpectedError(this);
    }
    return orElse();
  }
}

abstract class UnexpectedError<T> implements ValueFailure<T> {
  const factory UnexpectedError(T valor) = _$UnexpectedError<T>;

  @override
  T get valor;
  @override
  $UnexpectedErrorCopyWith<T, UnexpectedError<T>> get copyWith;
}

abstract class $NonDegreeValueCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $NonDegreeValueCopyWith(
          NonDegreeValue<T> value, $Res Function(NonDegreeValue<T>) then) =
      _$NonDegreeValueCopyWithImpl<T, $Res>;
  @override
  $Res call({T valor});
}

class _$NonDegreeValueCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $NonDegreeValueCopyWith<T, $Res> {
  _$NonDegreeValueCopyWithImpl(
      NonDegreeValue<T> _value, $Res Function(NonDegreeValue<T>) _then)
      : super(_value, (v) => _then(v as NonDegreeValue<T>));

  @override
  NonDegreeValue<T> get _value => super._value as NonDegreeValue<T>;

  @override
  $Res call({
    Object valor = freezed,
  }) {
    return _then(NonDegreeValue<T>(
      valor == freezed ? _value.valor : valor as T,
    ));
  }
}

class _$NonDegreeValue<T> implements NonDegreeValue<T> {
  const _$NonDegreeValue(this.valor) : assert(valor != null);

  @override
  final T valor;

  @override
  String toString() {
    return 'ValueFailure<$T>.nonDegreeValue(valor: $valor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NonDegreeValue<T> &&
            (identical(other.valor, valor) ||
                const DeepCollectionEquality().equals(other.valor, valor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(valor);

  @override
  $NonDegreeValueCopyWith<T, NonDegreeValue<T>> get copyWith =>
      _$NonDegreeValueCopyWithImpl<T, NonDegreeValue<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpectedError(T valor),
    @required Result nonDegreeValue(T valor),
  }) {
    assert(unexpectedError != null);
    assert(nonDegreeValue != null);
    return nonDegreeValue(valor);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpectedError(T valor),
    Result nonDegreeValue(T valor),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nonDegreeValue != null) {
      return nonDegreeValue(valor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpectedError(UnexpectedError<T> value),
    @required Result nonDegreeValue(NonDegreeValue<T> value),
  }) {
    assert(unexpectedError != null);
    assert(nonDegreeValue != null);
    return nonDegreeValue(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpectedError(UnexpectedError<T> value),
    Result nonDegreeValue(NonDegreeValue<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nonDegreeValue != null) {
      return nonDegreeValue(this);
    }
    return orElse();
  }
}

abstract class NonDegreeValue<T> implements ValueFailure<T> {
  const factory NonDegreeValue(T valor) = _$NonDegreeValue<T>;

  @override
  T get valor;
  @override
  $NonDegreeValueCopyWith<T, NonDegreeValue<T>> get copyWith;
}
