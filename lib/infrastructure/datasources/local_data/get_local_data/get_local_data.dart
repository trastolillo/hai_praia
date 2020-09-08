import 'package:dartz/dartz.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:hai_praia/infrastructure/core/enums_infraestructure.dart';

import '../../../../domain/core/server_failures.dart';
import '../../../dto/data_transfer_object.dart';
import '../bd/database.dart';

class LocalData {
  Database database;

  LocalData({
    @required this.database,
  });

  Future<void> addData({
    @required DtoObject dtoObject,
    @required Map<String, dynamic> toJson,
  }) async {
    await database.addToDatabaseAndDeleteOld(
      boxName: EnumToString.parse(dtoObject),
      map: toJson,
    );
  }

  Future<Either<Failure, DataTransferObject>> getData({
    @required DtoObject dtoObject,
    @required DataTransferObject Function(Map<String, dynamic> json) fromJson,
  }) async {
    final map =
        await database.getFromDatabase(boxName: EnumToString.parse(dtoObject));
    if (map['status'] == -1 || map == null) {
      final exception = DataTransferObjectException.fromJson(map) ??
          DataTransferObjectException(status: -2);
      return Left(
        Failure<DataTransferObjectException>.localDatabaseError(exception),
      );
    }
    final objeto = fromJson(map);
    return right(objeto);
  }
}
