import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show required;
import 'package:flutter/services.dart';

import '../../../../../domain/core/logger.dart';
import '../../../../../domain/core/server_failures.dart';
import '../../../../dto/openweather_dto/actual/openweather_actual_dto.dart';
import '../../../../dto/openweather_dto/openweather_dto.dart';
import '../../../../dto/openweather_dto/openweather_exception/openweather_exception.dart';
import '../../../../dto/openweather_dto/prediccion/openweather_prediccion_dto.dart';
import '../../url_services/url_services.dart';

class OpenweatherData {
  // TODO: Construir objeto Localizacion para implementar coordenadas
  final String localidad;
  final bool isActual;
  final Dio dio;

  OpenweatherData({
    @required this.localidad,
    @required this.isActual,
    @required this.dio,
  });

  Future<Either<ServerFailure, OpenweatherDto>> getData() async {
    try {
      final uri = UrlService.openweatherLocalidad(
        localidad: localidad,
        esHoy: isActual,
      );
      logger.i(uri.toString());
      final response = (await dio.getUri(uri)).data as Map<String, dynamic>;
      if (_isException(response)) {
        final openweatherException = OpenweatherException.fromJson(response);
        logger.e('Mensaje: ${openweatherException.message}');
        return left(ServerFailure<OpenweatherException>.serverError(
            openweatherException));
      }
      final result = isActual
          ? OpenweatherActualDto.fromJson(response)
          : OpenweatherPrediccionDto.fromJson(response);
      logger.i(result);
      return right(result);
    } on PlatformException catch (error) {
      logger.e(error.message);
      return left(ServerFailure<PlatformException>.serverError(error));
    }
  }

  bool _isException(Map<String, dynamic> response) {
    return isActual
        ? response['cod'] as int != 200
        : (response['cod'] as String) != '200';
  }
}
