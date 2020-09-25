import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hai_praia/domain/core/server_failures.dart';

import '../models/prediccion.dart';
import 'enums.dart';
import 'localizacion.dart';
import 'value_failures.dart';

abstract class IRepository {
  Future<Either<Failure, Prediccion>> getData({
    @required TipoPrediccion tipoPrediccion,
    @required Localizacion localizacion,
    bool isHardUpdate = false,
  });
}
