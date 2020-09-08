import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:location/location.dart';

import '../../../../../domain/core/logger.dart';
import '../../../../../domain/core/server_failures.dart';
import '../../../../dto/openweather_dto/actual/openweather_actual_dto.dart';
import '../../../../dto/openweather_dto/openweather_dto.dart';
import '../../../../dto/openweather_dto/openweather_exception/openweather_exception.dart';
import '../../../../dto/openweather_dto/prediccion/openweather_prediccion_dto.dart';
import '../../url_services/url_services.dart';

class OpenweatherData {
  // TODO: Construir objeto Localizacion para implementar coordenadas
  final bool isHoy;
  final String localidad;

  OpenweatherData({
    this.isHoy = true,
    this.localidad,
  });

  Future<Either<Failure, OpenweatherDto>> getData() async {
    final dio = Dio();
    try {
      final coords = await Location().getLocation();
      final uri = localidad == null
          ? UrlService.openweatherCoordenadas(location: coords, esHoy: isHoy)
          : UrlService.openweatherLocalidad(localidad: localidad, esHoy: isHoy);
      logger.i(uri.toString());
      final response = (await dio.getUri(uri)).data as Map<String, dynamic>;

      if (_isException(response)) {
        logger.d('_isException: ${_isException(response)}');
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

  bool _isException(Map<String, dynamic> response) =>
      response['cod'] != 200 && response['cod'] != '200';
}
