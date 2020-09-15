import 'package:dartz/dartz.dart';

import 'package:hai_praia/domain/core/enums.dart';
import 'package:hai_praia/domain/core/i_repository.dart';
import 'package:hai_praia/domain/core/localizacion.dart';
import 'package:hai_praia/domain/models/prediccion.dart';
import 'package:hai_praia/domain/core/value_failures.dart';
import 'package:hai_praia/infrastructure/datasources/local_data/get_local_data/get_local_data.dart';
import 'package:hai_praia/infrastructure/datasources/remote_data/get_remote_data/get_remote_data.dart';

class Repository implements IRepository {
  final LocalData localData;
  final RemoteData remoteData;

  Repository({
    this.localData,
    this.remoteData,
  });

  @override
  Future<Either<ValueFailure, Prediccion>> getData({
    String tipoPrediccion,
    Localizacion localizacion,
    bool isHardUpdate = false,
  }) {
    // TODO: implement getData
    throw UnimplementedError();
  }
}
