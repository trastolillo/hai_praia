import 'package:dartz/dartz.dart';

import '../core/failures.dart';
import '../core/value_object.dart';
import 'value_validators.dart';

class Direccion extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Direccion(int degrees) {
    assert(degrees != null);
    return Direccion._(fromDegreeToCardinal(degrees));
  }

  Direccion._(this.value);
}
