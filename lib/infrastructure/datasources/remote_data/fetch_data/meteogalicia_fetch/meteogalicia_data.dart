import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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

  Future<MeteogaliciaDto> getData() async {
    final uri = UrlService.meteoGalicia(
      diasPrediccion: diasPrediccion,
      locationId: locationId,
    );
    final response = await dio.getUri(uri);
    final result =
        MeteogaliciaDto.fromJson(response.data as Map<String, dynamic>);
    logger.i(result.toString());
    return result;
  }
}
