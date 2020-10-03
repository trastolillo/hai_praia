import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../models/prediccion.dart';
import 'enums.dart';
import 'localizacion.dart';
import 'server_failures.dart';

abstract class IRepository {
  Future<Either<Failure, Prediccion>> getData({
    @required TipoPrediccion tipoPrediccion,
    @required Localizacion localizacion,
    bool isHardUpdate = false,
  });
}
