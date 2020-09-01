import 'package:flutter/foundation.dart' show required;
import 'package:flutter/foundation.dart';

import '../../comunes.dart';

class City {
  City({
    @required this.id,
    @required this.name,
    @required this.coord,
    @required this.country,
    @required this.population,
    @required this.timezone,
    @required this.sunrise,
    @required this.sunset,
  });

  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: (json['id'] as num).toInt(),
        name: json['name'] as String,
        coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
        country: json['country'] as String,
        population: (json['population'] as num).toInt(),
        timezone: (json['timezone'] as num).toInt(),
        sunrise: (json['sunrise'] as num).toInt(),
        sunset: (json['sunset'] as num).toInt(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is City &&
        o.id == id &&
        o.name == name &&
        o.coord == coord &&
        o.country == country &&
        o.population == population &&
        o.timezone == timezone &&
        o.sunrise == sunrise &&
        o.sunset == sunset;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        coord.hashCode ^
        country.hashCode ^
        population.hashCode ^
        timezone.hashCode ^
        sunrise.hashCode ^
        sunset.hashCode;
  }

  @override
  String toString() {
    return 'City(id: $id, name: $name, coord: $coord, country: $country, population: $population, timezone: $timezone, sunrise: $sunrise, sunset: $sunset)';
  }
}

class ListElement {
  ListElement({
    @required this.dt,
    @required this.main,
    @required this.weather,
    @required this.clouds,
    @required this.wind,
    @required this.visibility,
    @required this.pop,
    @required this.sys,
    @required this.dtTxt,
    @required this.rain,
  });

  final int dt;
  final Main main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Sys sys;
  final String dtTxt;
  final Rain rain;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: (json['dt'] as num).toInt(),
        main: Main.fromJsonPrediccion(json['main'] as Map<String, dynamic>),
        weather: (json['weather'] as List<dynamic>)
            .map((weatherItem) =>
                Weather.fromJson(weatherItem as Map<String, dynamic>))
            .toList(),
        clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
        wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
        visibility: (json['visibility'] as num).toInt(),
        pop: (json['pop'] as num).toDouble(),
        sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
        dtTxt: json['dt_txt'] as String,
        rain: Rain.fromJson(json['rain'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'main': main.toJson(),
        'weather': weather.map((e) => e.toJson()).toList(),
        'clouds': clouds.toJson(),
        'wind': wind.toJson(),
        'visibility': visibility,
        'pop': pop,
        'rain': rain,
        'sys': sys.toJson(),
        'dt_txt': dtTxt,
      };

  @override
  String toString() {
    return 'ListElement(dt: $dt, main: $main, weather: $weather, clouds: $clouds, wind: $wind, visibility: $visibility, pop: $pop, sys: $sys, dtTxt: $dtTxt, rain: $rain)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ListElement &&
        o.dt == dt &&
        o.main == main &&
        listEquals(o.weather, weather) &&
        o.clouds == clouds &&
        o.wind == wind &&
        o.visibility == visibility &&
        o.pop == pop &&
        o.sys == sys &&
        o.dtTxt == dtTxt &&
        o.rain == rain;
  }

  @override
  int get hashCode {
    return dt.hashCode ^
        main.hashCode ^
        weather.hashCode ^
        clouds.hashCode ^
        wind.hashCode ^
        visibility.hashCode ^
        pop.hashCode ^
        sys.hashCode ^
        dtTxt.hashCode ^
        rain.hashCode;
  }
}

class Rain {
  Rain({
    @required this.the3H,
  });

  final double the3H;

  factory Rain.blank() => Rain(the3H: 0.0);

  factory Rain.fromJson(Map<String, dynamic> json) {
    return json == null
        ? Rain.blank()
        : Rain(
            the3H: (json['3h'] as num).toDouble() ?? 0.0,
          );
  }

  Map<String, dynamic> toJson() => {'3h': the3H ?? 0.0};

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Rain && o.the3H == the3H;
  }

  @override
  int get hashCode => the3H.hashCode;

  @override
  String toString() => 'Rain(the3H: $the3H)';
}

class Sys {
  Sys({
    @required this.pod,
  });

  final String pod;

  factory Sys.fromJson(Map<String, dynamic> json) =>
      Sys(pod: json['pod'] as String);

  Map<String, dynamic> toJson() => {'pod': pod};

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Sys && o.pod == pod;
  }

  @override
  int get hashCode => pod.hashCode;

  @override
  String toString() => 'Sys(pod: $pod)';
}
