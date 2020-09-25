import 'package:flutter/foundation.dart';

import '../../../domain/core/errors.dart';
import '../../../domain/core/value_failures.dart';
import '../../../domain/models/marea/marea.dart';
import '../../../domain/models/marea/tabla_mareas.dart';
import '../armada_dto/armada_dto.dart';
import '../openweather_dto/prediccion/openweather_prediccion_dto.dart';
import '../openweather_dto/prediccion/sub_dto/sub_dto.dart';
import '../sunrise_sunset_dto/sunrise_sunset_dto.dart';

class ListaMareasAdapter {
  final ArmadaDto armadaDto;
  final OpenweatherPrediccionDto openweatherPrediccionDto;
  final SunriseSunsetDto sunriseSunsetDto;

  ListaMareasAdapter({
    @required this.armadaDto,
    @required this.openweatherPrediccionDto,
    @required this.sunriseSunsetDto,
  });

  /// [TablaMareas] con la lista de repuntes del objeto [ArmadaDto]
  /// pasado en el constructor de [ListaMareasAdapter]
  TablaMareas get _tablaMareas {
    final List<Repunte> listaRepuntes = [];
    for (var i = 0; i < armadaDto.hours.length; i++) {
      final DateTime hora = DateTime.parse(armadaDto.hours[i]);
      listaRepuntes.add(Repunte(hora: hora, valor: armadaDto.values[i]));
    }
    return TablaMareas(repuntes: listaRepuntes);
  }

  /// Devuelve una [ListaMareas] desde los [DataTransferObject]
  ListaMareas dtoToListaMareas() {
    final List<Marea> listaProv = [];
    for (var i = 0; i < _tablaMareas.repuntes.length; i++) {
      final horaRepunte = _tablaMareas.repuntes[i].hora;
      final prediccion = _prediccion(horaRepunte.millisecondsSinceEpoch);
      final repunte = Repunte(
        hora: horaRepunte,
        valor: _tablaMareas.repuntes[i].valor,
      );
      final atmosfera = Atmosfera(
        temperatura: Temperatura(
            temperatura: prediccion.main.temp.toInt(),
            minima: prediccion.main.tempMin.toInt(),
            maxima: prediccion.main.tempMax.toInt()),
        viento: Viento(
            velocidad: prediccion.wind.speed.toInt(),
            direccion: Direccion(
              grados: prediccion.wind.deg,
            )),
      );
      final cielo = Cielo(
        id: prediccion.weather[0].id,
        descripcion: prediccion.weather[0].description,
        icono: Icono(
          id: prediccion.weather[0].icon,
        ),
      );
      final marea = Marea(repunte: repunte, atmosfera: atmosfera, cielo: cielo);
      listaProv.add(marea);
    }
    return ListaMareas(listaMareas: listaProv);
  }

  /// Retorna la predicción durante tres horas correspondiente al momento que
  /// se pasa por argumento
  ListElement _prediccion(int hora) {
    final listElement = openweatherPrediccionDto.list.firstWhere((listElement) {
      final diferenciaEntreHoras = hora - listElement.dt * 1000;
      return diferenciaEntreHoras > 0 && diferenciaEntreHoras < 10800000;
    });
    if (listElement != null) {
      return listElement;
    } else {
      throw UnexpectedValueError(ValueFailure.unexpectedError(listElement));
    }
  }
}
