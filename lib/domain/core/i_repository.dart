import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'enums.dart';
import 'localizacion.dart';
import 'prediccion.dart';
import 'value_failures.dart';

abstract class IRepository {
  Future<Either<ValueFailure, Prediccion>> getData({
    @required From tipoPrediccion,
    @required Localizacion localizacion,
    bool isHardUpdate = false,
  });
}
