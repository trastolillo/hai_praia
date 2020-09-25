import 'package:dartz/dartz.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../domain/core/server_failures.dart';
import '../../../core/enums_infraestructure.dart';
import '../../../dto/armada_dto/armada_dto.dart';
import '../../../dto/data_transfer_object.dart';
import '../../../dto/openweather_dto/actual/openweather_actual_dto.dart';
import '../../../dto/openweather_dto/prediccion/openweather_prediccion_dto.dart';
import '../../../dto/sunrise_sunset_dto/sunrise_sunset_dto.dart';
import '../bd/database.dart';
import '../cache_service.dart';

class LocalData {
  Database database;

  LocalData({
    @required this.database,
  });

  Future<Option<Failure>> addData({
    @required DtoObject dtoObject,
    @required Map<String, dynamic> map,
  }) async {
    final action = await database.addToDatabaseAndDeleteOld(
      boxName: EnumToString.parse(dtoObject),
      map: map,
    );
    if (action.isSome()) {
      final Map<String, dynamic> mapFromDatabase = action.getOrElse(() => null);
      final failure = DataTransferObjectException.fromJson(mapFromDatabase);
      return some(
          Failure<DataTransferObjectException>.localDatabaseError(failure));
    }
    return none();
  }

  Future<Either<Failure, DataTransferObject>> getData({
    @required DtoObject dtoObject,
  }) async {
    final map =
        await database.getFromDatabase(boxName: EnumToString.parse(dtoObject));
    if (map == null) {
      return Left(
        Failure<DataTransferObjectException>.localDatabaseError(
          DataTransferObjectException.empty(),
        ),
      );
    } else if (map['status'] == -1) {
      final exception = DataTransferObjectException.fromJson(map);
      return Left(
        Failure<DataTransferObjectException>.localDatabaseError(exception),
      );
    }
    final objeto = _fromJsonSwitch(dtoObject, map);
    return right(objeto);
  }

  Future<bool> isDatabaseEmpty(DtoObject dtoObject) async =>
      database.isEmpty(boxName: EnumToString.parse(dtoObject));

  bool isDtoUpdate(DataTransferObject dto) {
    final CacheService cacheService = CacheService(dto: dto);
    return cacheService.isDtoUpdate;
  }

  DataTransferObject _fromJsonSwitch(
      DtoObject dtoObject, Map<String, dynamic> map) {
    switch (dtoObject) {
      case DtoObject.armada:
        return ArmadaDto.fromJson(map);
      case DtoObject.openweatherActual:
        return OpenweatherActualDto.fromJson(map);
      case DtoObject.openweatherPrediccion:
        return OpenweatherPrediccionDto.fromJson(map);
      case DtoObject.sunriseSunset:
        return SunriseSunsetDto.fromJson(map);
      default:
        throw Exception();
    }
  }
}
