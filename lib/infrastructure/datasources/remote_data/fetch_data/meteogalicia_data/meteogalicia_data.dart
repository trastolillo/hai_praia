import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hai_praia/domain/core/server_failures.dart';
import 'package:hai_praia/infrastructure/dto/meteogalicia_dto/meteogalicia_exception/meteogalicia_exception.dart';

import '../../../../../domain/core/logger.dart';
import '../../../../dto/meteogalicia_dto/meteogalicia_dto.dart';
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

  Future<Either<ServerFailure, MeteogaliciaDto>> getData() async {
    try {
      final uri = UrlService.meteoGalicia(
        diasPrediccion: diasPrediccion,
        locationId: locationId,
      );
      final response = (await dio.getUri(uri)).data as Map<String, dynamic>;
      if (_isException(response)) {
        final meteogaliciaException = MeteogaliciaException.fromjson(response);
        logger.e(meteogaliciaException.message);
        return left(ServerFailure<MeteogaliciaException>.serverError(
            meteogaliciaException));
      }
      final result = MeteogaliciaDto.fromJson(response);
      logger.i(result.toString());
      return right(result);
    } on PlatformException catch (error) {
      logger.e(error.message);
      return left(ServerFailure<PlatformException>.serverError(error));
    }
  }

  bool _isException(Map<String, dynamic> jsonMap) =>
      jsonMap['exception'] != null;
}
