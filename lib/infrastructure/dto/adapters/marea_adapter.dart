import 'package:flutter/foundation.dart';

import '../../../domain/models/marea/marea.dart';
import '../../../domain/models/marea/tabla_mareas.dart';
import '../armada_dto/armada_dto.dart';
import '../openweather_dto/actual/openweather_actual_dto.dart';
import '../openweather_dto/prediccion/openweather_prediccion_dto.dart';
import '../openweather_dto/prediccion/sub_dto/sub_dto.dart';
import '../sunrise_sunset_dto/sunrise_sunset_dto.dart';

class MareaAdapter {
  final ArmadaDto armadaDto;
  final OpenweatherActualDto openweatherActualDto;
  final OpenweatherPrediccionDto openweatherPrediccionDto;
  final SunriseSunsetDto sunriseSunsetDto;
  final int horaPresenteEnMilisegundos;

  MareaAdapter({
    @required this.armadaDto,
    @required this.openweatherActualDto,
    @required this.openweatherPrediccionDto,
    @required this.sunriseSunsetDto,
    @required this.horaPresenteEnMilisegundos,
  });

  Marea dtoToMarea() => Marea(
        tablaMareas: _toTablaMareas(),
        atmosfera: Atmosfera(
          temperatura: _toTemperatura(),
          viento: _toViento(),
        ),
        cielo: _toCielo(),
      );

  ListElement get _prediccion {
    return openweatherPrediccionDto.list.firstWhere((listElement) {
      final diferenciaEntreHoras =
          horaPresenteEnMilisegundos - listElement.dt * 1000;
      return diferenciaEntreHoras > 0 && diferenciaEntreHoras < 10800000;
    });
  }

  TablaMareas _toTablaMareas() {
    final List<Repunte> listaRepuntes = [];
    for (var i = 0; i < armadaDto.hours.length; i++) {
      final DateTime hora = DateTime.parse(armadaDto.hours[i]);
      listaRepuntes.add(Repunte(hora: hora, valor: armadaDto.values[i]));
    }
    return TablaMareas(tabla: listaRepuntes);
  }

  Temperatura _toTemperatura() {
    return Temperatura(
      temperatura: _prediccion.main.temp.toInt(),
      minima: _prediccion.main.tempMin.toInt(),
      maxima: _prediccion.main.tempMax.toInt(),
    );
  }

  Viento _toViento() => Viento(
        velocidad: _prediccion.wind.speed.toInt(),
        direccion: Direccion(grados: _prediccion.wind.deg),
      );

  Cielo _toCielo() => Cielo(
        id: _prediccion.weather[0].id,
        descripcion: _prediccion.weather[0].description,
        icono: Icono(
          id: _prediccion.weather[0].icon,
        ),
      );
}
