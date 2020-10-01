import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../domain/core/localizacion.dart';
import '../../../../../domain/core/logger.dart';
import '../../../../../domain/core/server_failures.dart';
import '../../../../dto/sunrise_sunset_dto/sunrise_sunset_dto.dart';
import '../../../../dto/sunrise_sunset_dto/sunrise_sunset_exception.dart';
import '../../url_services/url_services.dart';

class SunriseSunsetData {
  final DateTime date;
  final dio = Dio();
  static const numeroDeDiasPrediccion = 5;

  SunriseSunsetData({
    this.date,
  });

  // TODO: borrar este archivo y análogos
  Future<Either<Failure, List<SunriseSunsetDto>>> getData() async {
    try {
      final List<SunriseSunsetDto> sunriseSunsetDtoList = [];
      for (var i = 0; i < numeroDeDiasPrediccion; i++) {
        final dia = DateTime.now().add(Duration(days: i));
        final coordenadas = await Localizacion().coordenadas;
        final uri = UrlService.sunriseSunset(
          location: coordenadas,
          date: dia,
        );
        final response = (await dio.getUri(uri)).data as Map<String, dynamic>;
        logger.i(response['status'].toString());
        if (_isException(response)) {
          final sunriseSunsetException =
              SunriseSunsetException.fromJson(response);
          logger.e(sunriseSunsetException.status);
          return left(Failure<SunriseSunsetException>.serverError(
              sunriseSunsetException));
        }
        final result = SunriseSunsetDto.fromJson(response);
        sunriseSunsetDtoList.add(result);
      }
      return right(sunriseSunsetDtoList);
    } on DioError catch (e) {
      logger.e('SunriseSunset: ${e.request.path}');
      logger.e(e.error);
      return left(Failure<DioError>.serverError(e));
    }
  }

  bool _isException(Map<String, dynamic> json) => json['status'] != 'OK';
}
