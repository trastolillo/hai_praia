import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show required;
import 'package:flutter/services.dart';

import '../../../../../domain/core/logger.dart';
import '../../../../../domain/core/server_failures.dart';
import '../../../../dto/meteogalicia_dto/meteogalicia_dto.dart';
import '../../../../dto/meteogalicia_dto/meteogalicia_exception/meteogalicia_exception.dart';
import '../../url_services/url_services.dart';

class MeteogaliciaData {
  final int diasPrediccion;
  final int locationId;
  final Dio dio;

  MeteogaliciaData({
    @required this.diasPrediccion,
    @required this.locationId,
    @required this.dio,
  });

  Future<Either<Failure, MeteogaliciaDto>> getData() async {
    try {
      final uri = UrlService.meteoGalicia(
        diasPrediccion: diasPrediccion,
        locationId: locationId,
      );
      final response = (await dio.getUri(uri)).data as Map<String, dynamic>;
      if (_isException(response)) {
        final meteogaliciaException = MeteogaliciaException.fromjson(response);
        logger.e(meteogaliciaException.message);
        return left(
            Failure<MeteogaliciaException>.serverError(meteogaliciaException));
      }
      final result = MeteogaliciaDto.fromJson(response);
      logger.i(result.toString());
      return right(result);
    } on PlatformException catch (error) {
      logger.e(error.message);
      return left(Failure<PlatformException>.serverError(error));
    }
  }

  bool _isException(Map<String, dynamic> jsonMap) =>
      jsonMap['exception'] != null;
}
