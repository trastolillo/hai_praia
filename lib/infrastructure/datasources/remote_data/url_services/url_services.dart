import 'package:flutter/foundation.dart' show required;
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import '../../../../domain/core/logger.dart';
import '../../../doc/api/api_key.dart';

class UrlService {
  static Uri meteoGalicia({
    @required int diasPrediccion,
    @required int locationId,
  }) {
    // TODO: Crear métodos para el formato de las fechas
    final String endTime = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().add(Duration(days: diasPrediccion)));
    return Uri(
        scheme: 'http',
        host: 'servizos.meteogalicia.es',
        path: '/apiv3/getTidesInfo',
        queryParameters: {
          'endtime': endTime,
          // TODO: Crear localizaciones
          'locationIds': locationId.toString(),
          'lang': 'es',
          'API_KEY': ApiKey.meteoGalicia,
        });
  }

  /// Envía consulta a Openweather a través de las coordenadas
  /// de posicionamiento. El parámetro booleano [esHoy] distingue entre los
  /// datos del día actual y la predicción de los días siguientes.
  static Uri openweatherCoordenadas({
    @required LocationData location,
    bool esHoy = true,
  }) {
    final tipoPrediccion = esHoy ? 'weather' : 'forecast';
    return Uri(
      scheme: 'http',
      host: 'api.openweathermap.org',
      path: '/data/2.5/$tipoPrediccion',
      queryParameters: {
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
        'lang': 'es',
        'units': 'metric',
        'appid': ApiKey.openweather
      },
    );
  }

  /// Envía consulta a Openweather a través de la localidad
  static Uri openweatherLocalidad({
    @required String localidad,
    bool esHoy = true,
  }) {
    final tipoPrediccion = esHoy ? 'weather' : 'forecast';
    return Uri(
      scheme: 'http',
      host: 'api.openweathermap.org',
      path: '/data/2.5/$tipoPrediccion',
      queryParameters: {
        'q': localidad,
        'lang': 'es',
        'units': 'metric',
        'appid': ApiKey.openweather
      },
    );
  }

  /// Toma de parámetro las coordenadas y el día. Si no se introduce
  /// el parámetro [DateTime] envía la fecha actual.
  static Uri sunriseSunset({
    @required LocationData location,
    DateTime date,
  }) {
    final diaPrediccion =
        date != null ? "${date.year}-${date.month}-${date.day}" : 'today';
    return Uri(
      scheme: 'https',
      host: 'api.sunrise-sunset.org',
      path: '/json',
      queryParameters: {
        'date': diaPrediccion,
        'lat': location.latitude.toString(),
        'lng': location.longitude.toString(),
        'formatted': '0'
      },
    );
  }

  static Uri armadaDiaria({
    @required String puerto,
    DateTime date,
  }) {
    // TODO: Urgente implementar los métodos DateTime
    final dateOrToday = date ?? DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    final fecha = formatter.format(dateOrToday);
    // final dia = dateOrToday.day;
    // final mes = dateOrToday.month;
    final year = dateOrToday.year;
    return Uri(
      scheme: 'https',
      host: 'armada.defensa.gob.es',
      path:
          'ihm/Documentacion/Mareas//json/$year/${puerto.toLowerCase()}/${puerto.toLowerCase()}_$fecha.json',
    );
  }

  static Uri armadaMensual({
    @required String puerto,
    DateTime date,
  }) {
    // TODO: Urgente implementar los métodos DateTime
    final dateOrToday = date ?? DateTime.now();
    final mes = dateOrToday.month.toString().padLeft(2, '0');
    final year = dateOrToday.year;
    return Uri(
      scheme: 'https',
      host: 'armada.defensa.gob.es',
      path:
          'ihm/Documentacion/Mareas//json/$year/${puerto.toLowerCase()}/${puerto.toLowerCase()}_mes_$mes.json',
    );
  }
  // santander_mes_09.json

}
