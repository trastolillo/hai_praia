import 'package:flutter/foundation.dart';

import '../comunes.dart';
import '../openweather_dto.dart';
import 'sub_dto/sub_dto.dart';

class OpenweatherActualDto extends OpenweatherDto {
  OpenweatherActualDto({
    @required this.coord,
    @required this.weather,
    @required this.base,
    @required this.main,
    @required this.visibility,
    @required this.wind,
    @required this.clouds,
    @required this.dt,
    @required this.sys,
    @required this.timezone,
    @required this.id,
    @required this.name,
    @required this.cod,
  });

  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  factory OpenweatherActualDto.fromJson(Map<String, dynamic> json) =>
      OpenweatherActualDto(
        coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
        weather: (json['weather'] as List<dynamic>)
            .map((weatherItem) =>
                Weather.fromJson(weatherItem as Map<String, dynamic>))
            .toList(),
        base: json['base'] as String,
        main: Main.fromJson(json['main'] as Map<String, dynamic>),
        visibility: (json['visibility'] as num).toInt(),
        wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
        clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
        dt: (json['dt'] as num).toInt(),
        sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
        timezone: (json['timezone'] as num).toInt(),
        id: (json['id'] as num).toInt(),
        name: json['name'] as String,
        cod: (json['cod'] as num).toInt(),
      );

  Map<String, dynamic> toJson() => {
        'coord': coord,
        'weather': weather.map((weatherItem) => weatherItem.toJson()).toList(),
        'base': base,
        'main': main.toJson(),
        'visibility': visibility,
        'wind': wind.toJson(),
        'clouds': clouds.toJson(),
        'dt': dt,
        'sys': sys.toJson(),
        'timezone': timezone,
        'id': id,
        'name': name,
        'cod': cod,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is OpenweatherActualDto &&
        listEquals(o.weather, weather) &&
        o.base == base &&
        o.main == main &&
        o.visibility == visibility &&
        o.wind == wind &&
        o.clouds == clouds &&
        o.dt == dt &&
        o.sys == sys &&
        o.timezone == timezone &&
        o.id == id &&
        o.name == name &&
        o.cod == cod;
  }

  @override
  int get hashCode {
    return weather.hashCode ^
        base.hashCode ^
        main.hashCode ^
        visibility.hashCode ^
        wind.hashCode ^
        clouds.hashCode ^
        dt.hashCode ^
        sys.hashCode ^
        timezone.hashCode ^
        id.hashCode ^
        name.hashCode ^
        cod.hashCode;
  }

  @override
  String toString() {
    return 'OpenweatherActualDto(weather: $weather, base: $base, main: $main, visibility: $visibility, wind: $wind, clouds: $clouds, dt: $dt, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $cod)';
  }
}
