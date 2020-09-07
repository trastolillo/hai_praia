import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show required;

import '../../../../../domain/core/logger.dart';
import '../../../../../domain/core/server_failures.dart';
import '../../../../dto/armada_dto/armada_dto.dart';
import '../../url_services/url_services.dart';

class ArmadaData {
  final String puerto;
  final DateTime date;

  ArmadaData({
    @required this.puerto,
    this.date,
  });

  Future<Either<ServerFailure, ArmadaDto>> getData(
      {bool isDiaria = true}) async {
    try {
      final dio = Dio();
      final uri = isDiaria
          ? UrlService.armadaDiaria(puerto: puerto, date: date)
          : UrlService.armadaMensual(puerto: puerto, date: date);
      final response = (await dio.getUri(uri)).data as Map<String, dynamic>;
      final result = ArmadaDto.fromJson(response);
      logger.d(result);
      return right(result);
    } on DioError catch (e) {
      logger.e('Armada: ${e.request.path}');
      logger.e(e.error);
      return left(ServerFailure<DioError>.serverError(e));
    }
  }
}
