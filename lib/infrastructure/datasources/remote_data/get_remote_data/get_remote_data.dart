import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:location/location.dart';

import '../../../../domain/core/localizacion.dart';
import '../../../../domain/core/logger.dart';
import '../../../../domain/core/server_failures.dart';
import '../../../core/enums_infraestructure.dart';
import '../../../dto/armada_dto/armada_dto.dart';
import '../../../dto/data_transfer_object.dart';
import '../../../dto/openweather_dto/actual/openweather_actual_dto.dart';
import '../../../dto/openweather_dto/openweather_dto.dart';
import '../../../dto/openweather_dto/openweather_exception/openweather_exception.dart';
import '../../../dto/openweather_dto/prediccion/openweather_prediccion_dto.dart';
import '../../../dto/sunrise_sunset_dto/sunrise_sunset_dto.dart';
import '../../../dto/sunrise_sunset_dto/sunrise_sunset_exception.dart';
import '../url_services/url_services.dart';

class RemoteData {
  Future<Either<Failure, DataTransferObject>> getRemoteData({
    @required DtoObject dtoObject,
    @required Localizacion localizacion,
    bool isHoy,
    DateTime date,
  }) async {
    switch (dtoObject) {
      case DtoObject.armada:
        return _getArmadaData(puerto: localizacion, date: date);
        break;
      case DtoObject.openweatherActual:
        return _getOpenweatherData(
            localidad: localizacion.localidad, isHoy: true);
        break;
      case DtoObject.openweatherPrediccion:
        return _getOpenweatherData(
            localidad: localizacion.localidad, isHoy: false);
        break;
      case DtoObject.sunriseSunset:
        return _getSunriseSunsetData(date: date);
        break;
      default:
        return left(
          const Failure<String>.serverError('Remote Data - Error imposible'),
        );
    }
  }

  Future<Either<Failure, ArmadaDto>> _getArmadaData({
    @required Localizacion puerto,
    @required DateTime date,
    bool isDiaria = true,
  }) async {
    try {
      final dio = Dio();
      final uri = isDiaria
          ? UrlService.armadaDiaria(puerto: puerto.localidad, date: date)
          : UrlService.armadaMensual(puerto: puerto.localidad, date: date);
      final response = (await dio.getUri(uri)).data as Map<String, dynamic>;
      final result = ArmadaDto.fromJson(response);
      logger.d(result);
      return right(result);
    } on DioError catch (e) {
      logger.e('Armada: ${e.request.path}');
      logger.e(e.error);
      return left(Failure<DioError>.serverError(e));
    }
  }

  Future<Either<Failure, OpenweatherDto>> _getOpenweatherData({
    @required String localidad,
    @required bool isHoy,
  }) async {
    final dio = Dio();
    try {
      final coords = await Location().getLocation();
      final uri = localidad == null
          ? UrlService.openweatherCoordenadas(location: coords, esHoy: isHoy)
          : UrlService.openweatherLocalidad(localidad: localidad, esHoy: isHoy);
      logger.i(uri.toString());
      final response = (await dio.getUri(uri)).data as Map<String, dynamic>;
      final bool isException =
          response['cod'] != 200 && response['cod'] != '200';
      if (isException) {
        logger.d('_isException: $isException');
        final openweatherException = OpenweatherException.fromJson(response);
        logger.e('Mensaje: ${openweatherException.message}');
        return left(
            Failure<OpenweatherException>.serverError(openweatherException));
      }
      final result = isHoy
          ? OpenweatherActualDto.fromJson(response)
          : OpenweatherPrediccionDto.fromJson(response);
      logger.i(result);
      return right(result);
    } on DioError catch (e) {
      logger.e(e.request.path);
      logger.e(e.error);
      return left(Failure<DioError>.serverError(e));
    }
  }

  Future<Either<Failure, SunriseSunsetDto>> _getSunriseSunsetData({
    DateTime date,
  }) async {
    try {
      final dio = Dio();
      final coordenadas = await Localizacion().coordenadas;
      final uri = UrlService.sunriseSunset(
        location: coordenadas,
        date: date,
      );
      final response = (await dio.getUri(uri)).data as Map<String, dynamic>;
      logger.i(response['status'].toString());
      if (response['status'] != 'OK') {
        final sunriseSunsetException =
            SunriseSunsetException.fromJson(response);
        logger.e(sunriseSunsetException.status);
        return left(Failure<SunriseSunsetException>.serverError(
            sunriseSunsetException));
      }
      final result = SunriseSunsetDto.fromJson(response);
      logger.i(result);
      return right(result);
    } on DioError catch (e) {
      logger.e('SunriseSunset: ${e.request.path}');
      logger.e(e.error);
      return left(Failure<DioError>.serverError(e));
    }
  }
}
