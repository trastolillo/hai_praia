import 'package:flutter/foundation.dart' show required;
import 'package:intl/intl.dart';
import 'package:location/location.dart';

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
    @required bool esHoy,
  }) {
    final tipoPrediccion = esHoy ? 'weather' : 'forecast';
    return Uri(
      scheme: 'http',
      host: 'api.openweathermap.org',
      path: '/data/2.5/$tipoPrediccion',
      queryParameters: {
        'lat': location.latitude,
        'lon': location.longitude,
        'lang': 'es',
        'units': 'metric',
        'appid': ApiKey.openweather
      },
    );
  }

  /// Envía consulta a Openweather a través de la localidad
  static Uri openweatherLocalidad({
    @required String localidad,
    @required bool esHoy,
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
        'lat': location.latitude,
        'lng': location.longitude,
        'formatted': '0'
      },
    );
  }
}
