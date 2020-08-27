import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'enums.dart';
import 'failures.dart';
import 'localizacion.dart';
import 'prediccion.dart';

abstract class IRepository {
  Future<Either<ValueFailure, Prediccion>> getData({
    @required From tipoPrediccion,
    @required Localizacion localizacion,
    bool isHardUpdate = false,
  });
}
