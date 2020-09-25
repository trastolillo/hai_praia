import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../domain/core/enums.dart';
import '../../domain/core/i_repository.dart';
import '../../domain/core/localizacion.dart';
import '../../domain/core/logger.dart';
import '../../domain/core/server_failures.dart';
import '../../domain/models/prediccion.dart';
import '../core/enums_infraestructure.dart';
import '../datasources/local_data/get_local_data/get_local_data.dart';
import '../datasources/remote_data/get_remote_data/get_remote_data.dart';
import '../datasources/remote_data/network/network_info.dart';
import '../dto/adapters/marea_adapter.dart';
import '../dto/armada_dto/armada_dto.dart';
import '../dto/data_transfer_object.dart';
import '../dto/openweather_dto/prediccion/openweather_prediccion_dto.dart';
import '../dto/sunrise_sunset_dto/sunrise_sunset_dto.dart';

class Repository implements IRepository {
  final NetworkInfo networkInfo;
  final LocalData localData;
  final RemoteData remoteData;

  Repository({
    @required this.networkInfo,
    @required this.localData,
    @required this.remoteData,
  });

  @override
  Future<Either<Failure, Prediccion>> getData({
    @required TipoPrediccion tipoPrediccion,
    @required Localizacion localizacion,
    bool isHardUpdate = false,
  }) async {
    ArmadaDto armadaDto;
    OpenweatherPrediccionDto openweatherPrediccionDto;
    SunriseSunsetDto sunriseSunsetDto;
    Failure failure;
    // Obtener el objeto ArmadaDto
    final armadaDtoOrFailure = await remoteOrLocal(
      dtoObject: DtoObject.armada,
      localizacion: localizacion,
      isHardUpddate: isHardUpdate,
    );
    armadaDtoOrFailure.fold(
      (l) => failure = l,
      (r) => armadaDto = r as ArmadaDto,
    );
    if (armadaDtoOrFailure.isLeft()) {
      return left(failure);
    }
    // Obtener el objeto OpenweatherPrediccionDto
    final openWeatherPrediccionOrFailure = await remoteOrLocal(
        dtoObject: DtoObject.openweatherPrediccion,
        localizacion: localizacion,
        isHardUpddate: isHardUpdate);
    openWeatherPrediccionOrFailure.fold(
      (l) => failure = l,
      (r) => openweatherPrediccionDto = r as OpenweatherPrediccionDto,
    );
    if (openWeatherPrediccionOrFailure.isLeft()) {
      return left(failure);
    }
    // Obtener el objeto SunriseSunset
    final sunriseSunsetDtoOrFailure = await remoteOrLocal(
      dtoObject: DtoObject.sunriseSunset,
      localizacion: localizacion,
      isHardUpddate: isHardUpdate,
    );
    sunriseSunsetDtoOrFailure.fold(
      (l) => failure = l,
      (r) => sunriseSunsetDto = r as SunriseSunsetDto,
    );
    if (sunriseSunsetDtoOrFailure.isLeft()) {
      return left(failure);
    }
    if (tipoPrediccion == TipoPrediccion.listaMareas) {
      // Crear el objeto que se retorna
      final listaMareasAdapter = ListaMareasAdapter(
        armadaDto: armadaDto,
        openweatherPrediccionDto: openweatherPrediccionDto,
        sunriseSunsetDto: sunriseSunsetDto,
      );
      return right(listaMareasAdapter.dtoToListaMareas());
    }
    return null;
  }

  Future<Either<Failure, DataTransferObject>> remoteOrLocal({
    @required DtoObject dtoObject,
    @required Localizacion localizacion,
    bool isHardUpddate = false,
  }) async {
    if (await networkInfo.isConnected &&
        (isHardUpddate ||
            !await localData.isDtoUpdate(dtoObject) ||
            await localData.isDatabaseEmpty(dtoObject))) {
      logger.d('Entra en remoteOrLocal $dtoObject - remoto');

      return remoteData.getRemoteData(
        dtoObject: dtoObject,
        localizacion: localizacion,
      );
    } else {
      logger.d('Entra en remoteOrLocal $dtoObject - local');
      return localData.getData(dtoObject: dtoObject);
    }
  }
}
