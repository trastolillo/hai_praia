import 'package:dartz/dartz.dart';
import 'package:enum_to_string/enum_to_string.dart';

import '../../core/enums.dart';
import '../../core/value_failures.dart';

Either<ValueFailure<String>, String> fromDegreeToCardinal(int degrees) {
  if ((degrees >= 0 && degrees <= 23) || (degrees >= 337 && degrees <= 360)) {
    return right(EnumToString.parse(VientoDel.norte));
  } else if (degrees >= 24 && degrees <= 68) {
    return right(EnumToString.parse(VientoDel.noreste));
  } else if (degrees >= 69 && degrees <= 113) {
    return right(EnumToString.parse(VientoDel.este));
  } else if (degrees >= 114 && degrees <= 158) {
    return right(EnumToString.parse(VientoDel.sureste));
  } else if (degrees >= 159 && degrees <= 203) {
    return right(EnumToString.parse(VientoDel.sur));
  } else if (degrees >= 204 && degrees <= 248) {
    return right(EnumToString.parse(VientoDel.suroeste));
  } else if (degrees >= 249 && degrees <= 293) {
    return right(EnumToString.parse(VientoDel.oeste));
  } else if (degrees >= 294 && degrees <= 336) {
    return right(EnumToString.parse(VientoDel.noroeste));
  } else {
    return left(ValueFailure.nonDegreeValue(
        EnumToString.parse("Error: $degrees no son grados")));
  }
}
