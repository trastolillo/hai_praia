import 'package:flutter/foundation.dart';
import 'package:location/location.dart';

import '../../../domain/core/localizacion.dart';
import '../../core/date_utils.dart';
import '../../dto/armada_dto/armada_dto.dart';
import '../../dto/openweather_dto/actual/openweather_actual_dto.dart';
import '../../dto/openweather_dto/prediccion/openweather_prediccion_dto.dart';
import '../../dto/sunrise_sunset_dto/sunrise_sunset_dto.dart';

class CacheService {
  final OpenweatherActualDto openweatherActualDto;
  final OpenweatherPrediccionDto openweatherPrediccionDto;
  final SunriseSunsetDto sunriseSunsetDto;
  final ArmadaDto armadaDto;

  CacheService({
    @required this.openweatherActualDto,
    @required this.openweatherPrediccionDto,
    @required this.sunriseSunsetDto,
    @required this.armadaDto,
  });

  DateTime get _timeToUpdateArmada {
    final isMensual = armadaDto.values.length > 28;
    DateTime getDataDate;
    // Obtención de la fecha en que se obtienen los datos
    if (!isMensual) {
      getDataDate = DateTime.parse(armadaDto.fecha);
    } else {
      final dateParsed = armadaDto.fecha.split(', ').map((e) {
        return e
          ..trim()
          ..toLowerCase();
      }).toList();
      getDataDate = DateTime(
        int.tryParse(dateParsed[1]),
        monthStringToInt(dateParsed[0]),
      );
    }
    return isMensual
        ? getDataDate.add(const Duration(days: 30))
        : getDataDate.add(const Duration(days: 4));
  }

  // TODO Implementar geolocalización por Provincia
  Future<bool> _isLocationChanged(LocationData locationData) async {
    return true;
  }

  DateTime get _timeToUpdateOpenweatherActual {
    final getDataDate =
        DateTimeExtension.fromSecondsSinceEpoch(openweatherActualDto.dt);
    return getDataDate.add(const Duration(hours: 3));
  }

  DateTime get _timeToUpdateOpenweatherPrediccion {
    final ultimaIteracion = openweatherPrediccionDto.list.length - 1 ?? 0;
    return DateTimeExtension.fromSecondsSinceEpoch(
            openweatherPrediccionDto.list[ultimaIteracion].dt)
        .onlyDate;
  }

  DateTime get _timeToUpdateSunriseSunset =>
      DateTime.parse(sunriseSunsetDto.results.sunrise).onlyDate;

  bool isArmadaUpdate() => DateTime.now().compareTo(_timeToUpdateArmada) <= 0;

  bool isOpenweatherActualUpdate() =>
      DateTime.now().compareTo(_timeToUpdateOpenweatherActual) <= 0;

  bool isOpenweatherPrediccionUpdate() =>
      DateTime.now().compareTo(_timeToUpdateOpenweatherPrediccion) <= 0;

  bool isSunriseSunsetUpdate() =>
      DateTime.now().compareTo(_timeToUpdateSunriseSunset) <= 0;
}
