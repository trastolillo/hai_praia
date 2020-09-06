import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../dto/armada_dto/armada_dto.dart';
import '../../dto/meteogalicia_dto/meteogalicia_dto.dart';
import '../../dto/openweather_dto/actual/openweather_actual_dto.dart';
import '../../dto/openweather_dto/prediccion/openweather_prediccion_dto.dart';
import '../../dto/sunrise_sunset_dto/sunrise_sunset_dto.dart';

class CacheService {
  final MeteogaliciaDto meteogaliciaDto;
  final OpenweatherActualDto openweatherActualDto;
  final OpenweatherPrediccionDto openweatherPrediccionDto;
  final SunriseSunsetDto sunriseSunsetDto;
  final ArmadaDto armadaDto;

  CacheService({
    @required this.meteogaliciaDto,
    @required this.openweatherActualDto,
    @required this.openweatherPrediccionDto,
    @required this.sunriseSunsetDto,
    @required this.armadaDto,
  });

  int get _claveActualizacionArmada =>
      armadaDto.isMensual ? armadaDto.currentMonth : armadaDto.currentDay;

  int get _claveActualizacionOpenweatherActual {
    final fechaPedido =
        DateTime.fromMillisecondsSinceEpoch(openweatherActualDto.dt * 1000);
    final fechaFinal = fechaPedido.add(const Duration(hours: 3));

    return fechaFinal.millisecondsSinceEpoch;
  }

  int get claveActualizacionOpenweatherPrediccion =>
      DateTime.fromMillisecondsSinceEpoch(
              openweatherPrediccionDto.list[0].dt * 1000)
          .day;

  int get claveActualizacionSunriseSunset =>
      DateTime.parse(sunriseSunsetDto.results.sunrise).day;
}
