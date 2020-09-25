import 'package:flutter/foundation.dart';
import 'package:hai_praia/infrastructure/dto/data_transfer_object.dart';
import 'package:location/location.dart';

import '../../core/date_utils.dart';
import '../../dto/armada_dto/armada_dto.dart';
import '../../dto/openweather_dto/actual/openweather_actual_dto.dart';
import '../../dto/openweather_dto/prediccion/openweather_prediccion_dto.dart';
import '../../dto/sunrise_sunset_dto/sunrise_sunset_dto.dart';

class CacheService {
  final DataTransferObject dto;

  CacheService({
    @required this.dto,
  });

  DateTime _timeToUpdateArmada(ArmadaDto armadaDto) {
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
    return false;
  }

  DateTime _timeToUpdateOpenweatherActual(
      OpenweatherActualDto openweatherActualDto) {
    final getDataDate =
        DateTimeExtension.fromSecondsSinceEpoch(openweatherActualDto.dt);
    return getDataDate.add(const Duration(hours: 3));
  }

  DateTime _timeToUpdateOpenweatherPrediccion(
      OpenweatherPrediccionDto openweatherPrediccionDto) {
    final ultimaIteracion = openweatherPrediccionDto.list.length - 1 ?? 0;
    return DateTimeExtension.fromSecondsSinceEpoch(
            openweatherPrediccionDto.list[ultimaIteracion].dt)
        .onlyDate;
  }

  DateTime _timeToUpdateSunriseSunset(SunriseSunsetDto sunriseSunsetDto) =>
      DateTime.parse(sunriseSunsetDto.results.sunrise).onlyDate;

  bool get isDtoUpdate {
    if (dto is ArmadaDto) {
      return DateTime.now().compareTo(_timeToUpdateArmada(dto as ArmadaDto)) <=
          0;
    } else if (dto is OpenweatherActualDto) {
      return DateTime.now().compareTo(
              _timeToUpdateOpenweatherActual(dto as OpenweatherActualDto)) <=
          0;
    } else if (dto is OpenweatherPrediccionDto) {
      return DateTime.now().compareTo(_timeToUpdateOpenweatherPrediccion(
              dto as OpenweatherPrediccionDto)) <=
          0;
    } else if (dto is SunriseSunsetDto) {
      return DateTime.now()
              .compareTo(_timeToUpdateSunriseSunset(dto as SunriseSunsetDto)) <=
          0;
    } else {
      return false;
    }
  }
}
