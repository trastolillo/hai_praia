import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show required;
import 'package:flutter/services.dart';

import '../../../../../domain/core/localizacion.dart';
import '../../../../../domain/core/logger.dart';
import '../../../../../domain/core/server_failures.dart';
import '../../../../dto/sunrise_sunset_dto/sunrise_sunset_dto.dart';
import '../../../../dto/sunrise_sunset_dto/sunrise_sunset_exception.dart';
import '../../url_services/url_services.dart';

class SunriseSunsetData {
  final DateTime date;
  final dio = Dio();

  SunriseSunsetData({
    this.date,
  });

  Future<Either<ServerFailure, SunriseSunsetDto>> getData() async {
    try {
      final coordenadas = await Localizacion().coordenadas;
      logger.i(coordenadas.latitude.toString());
      final uri = UrlService.sunriseSunset(
        location: coordenadas,
        date: date,
      );
      logger.i(uri);
      // TODO: implementar interceptadores de Dio
      final response = (await dio.getUri(uri)).data as Map<String, dynamic>;
      logger.i(response['status'].toString());
      if (_isException(response)) {
        final sunriseSunsetException =
            SunriseSunsetException.fromJson(response);
        logger.e(sunriseSunsetException.status);
        return left(ServerFailure<SunriseSunsetException>.serverError(
            sunriseSunsetException));
      }
      final result = SunriseSunsetDto.fromJson(response);
      logger.i(result);
      return right(result);
    } on PlatformException catch (e) {
      logger.e(e.message);
      return left(ServerFailure<PlatformException>.serverError(e));
    }
  }

  bool _isException(Map<String, dynamic> json) => json['status'] != 'OK';
}
