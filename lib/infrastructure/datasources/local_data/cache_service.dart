import 'package:flutter/foundation.dart';
import 'package:hai_praia/domain/core/logger.dart';
import 'package:location/location.dart';

import '../../core/date_utils.dart';
import '../../core/enums_infraestructure.dart';

class CacheService {
  static const _diasAntiguedadArmadaDto = 15;
  static const _diasAntiguedadOpenweatherPrediccion = 4;
  static const _horasAntiguedadOpenweatherActual = 3;
  static const _diasAntiguedadSunriseSunset = 1;
  final DtoObject dtoObject;

  CacheService({
    @required this.dtoObject,
  });

  // TODO Implementar geolocalización por Provincia
  Future<bool> _isLocationChanged(LocationData locationData) async {
    return false;
  }

  DateTime _timeToUpdate(int key) {
    final fechaKey = DateTime.fromMillisecondsSinceEpoch(key);
    switch (dtoObject) {
      case DtoObject.armada:
        return fechaKey.add(const Duration(days: _diasAntiguedadArmadaDto));
        break;
      case DtoObject.openweatherActual:
        return fechaKey
            .add(const Duration(hours: _horasAntiguedadOpenweatherActual));
        break;
      case DtoObject.openweatherPrediccion:
        return fechaKey
            .add(const Duration(days: _diasAntiguedadOpenweatherPrediccion));
        break;
      case DtoObject.sunriseSunset:
        return fechaKey.add(const Duration(days: _diasAntiguedadSunriseSunset));
        break;
      default:
        throw Exception();
    }
  }

  bool isDtoUpdate(int key) {
    final ahora = DateTime.now();
    return ahora.compareTo(_timeToUpdate(key)) <= 0;
  }
}
