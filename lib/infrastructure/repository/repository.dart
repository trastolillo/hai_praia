import 'package:dartz/dartz.dart';
import 'package:hai_praia/domain/core/logger.dart';

import '../../domain/core/enums.dart';
import '../../domain/core/i_repository.dart';
import '../../domain/core/localizacion.dart';
import '../../domain/core/server_failures.dart';
import '../../domain/models/prediccion.dart';
import '../core/enums_infraestructure.dart';
import '../datasources/local_data/get_local_data/get_local_data.dart';
import '../datasources/remote_data/get_remote_data/get_remote_data.dart';
import '../datasources/remote_data/network/network_info.dart';
import '../dto/adapters/marea_adapter.dart';
import '../dto/armada_dto/armada_dto.dart';
import '../dto/openweather_dto/prediccion/openweather_prediccion_dto.dart';
import '../dto/sunrise_sunset_dto/sunrise_sunset_dto.dart';

class Repository implements IRepository {
  final NetworkInfo networkInfo;
  final LocalData localData;
  final RemoteData remoteData;

  Repository({
    this.networkInfo,
    this.localData,
    this.remoteData,
  });

  @override
  Future<Either<Failure, Prediccion>> getData({
    TipoPrediccion tipoPrediccion,
    Localizacion localizacion,
    bool isHardUpdate = false,
  }) async {
    //? Pide la info en remoto
    if (await networkInfo.isConnected || isHardUpdate) {
      if (tipoPrediccion == TipoPrediccion.listaMareas) {
        Failure failure;
        // Obtener el objeto ArmadaDto
        final armadaDtoOrFailure = await remoteData.getRemoteData(
          dtoObject: DtoObject.armada,
          localizacion: localizacion,
        );
        ArmadaDto armadaDto;
        armadaDtoOrFailure.fold(
          (l) {
            failure = l;
          },
          (r) {
            armadaDto = r as ArmadaDto;
          },
        );
        if (armadaDtoOrFailure.isLeft()) {
          return left(failure);
        }
        // Obtener el objeto OpenweatherPrediccionDto
        OpenweatherPrediccionDto openweatherPrediccionDto;
        final openWeatherPrediccionOrFailure = await remoteData.getRemoteData(
          dtoObject: DtoObject.openweatherPrediccion,
          localizacion: localizacion,
        );
        openWeatherPrediccionOrFailure.fold(
          (l) => failure = l,
          (r) => openweatherPrediccionDto = r as OpenweatherPrediccionDto,
        );
        if (openWeatherPrediccionOrFailure.isLeft()) {
          return left(failure);
        }
        // Obtener el objeto SunriseSunset
        SunriseSunsetDto sunriseSunsetDto;
        final sunriseSunsetDtoOrFailure = await remoteData.getRemoteData(
            dtoObject: DtoObject.sunriseSunset, localizacion: localizacion);
        sunriseSunsetDtoOrFailure.fold(
          (l) => failure = l,
          (r) => sunriseSunsetDto = r as SunriseSunsetDto,
        );
        if (sunriseSunsetDtoOrFailure.isLeft()) {
          return left(failure);
        }
        // Crear el objeto que se retorna
        final listaMareasAdapter = ListaMareasAdapter(
          armadaDto: armadaDto,
          openweatherPrediccionDto: openweatherPrediccionDto,
          sunriseSunsetDto: sunriseSunsetDto,
        );
        return right(listaMareasAdapter.dtoToListaMareas());
      }
    } else {
      //? Pide la info en local
    }
    return null;
  }
}
