import 'package:flutter/foundation.dart' show required;

class Coord {
  Coord({
    @required this.lon,
    @required this.lat,
  });

  final double lon;
  final double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: (json['lat'] as num).toDouble(),
        lon: (json['lon'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lon': lon,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Coord && o.lon == lon && o.lat == lat;
  }

  @override
  int get hashCode => lon.hashCode ^ lat.hashCode;

  @override
  String toString() => 'Coord(lon: $lon, lat: $lat)';
}

class Main {
  Main({
    @required this.temp,
    @required this.feelsLike,
    @required this.tempMin,
    @required this.tempMax,
    @required this.pressure,
    @required this.humidity,
  });

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  int seaLevel;
  int grndLevel;
  double tempKf;

  Main.mainClass({
    @required this.temp,
    @required this.feelsLike,
    @required this.tempMin,
    @required this.tempMax,
    @required this.pressure,
    @required this.humidity,
    @required this.seaLevel,
    @required this.grndLevel,
    @required this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: (json['temp'] as num).toDouble(),
        feelsLike: (json['feels_like'] as num).toDouble(),
        tempMin: (json['temp_min'] as num).toDouble(),
        tempMax: (json['temp_max'] as num).toDouble(),
        pressure: (json['pressure'] as num).toInt(),
        humidity: (json['humidity'] as num).toInt(),
      );

  factory Main.fromJsonPrediccion(Map<String, dynamic> json) => Main.mainClass(
        temp: (json['temp'] as num).toDouble(),
        feelsLike: (json['feels_like'] as num).toDouble(),
        tempMin: (json['temp_min'] as num).toDouble(),
        tempMax: (json['temp_max'] as num).toDouble(),
        pressure: (json['pressure'] as num).toInt(),
        humidity: (json['humidity'] as num).toInt(),
        seaLevel: (json['sea_level'] as num).toInt(),
        grndLevel: (json['grnd_level'] as num).toInt(),
        tempKf: (json['temp_kf'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
      };

  Map<String, dynamic> toJsonPrediccion() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "temp_kf": tempKf,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Main &&
        o.temp == temp &&
        o.feelsLike == feelsLike &&
        o.tempMin == tempMin &&
        o.tempMax == tempMax &&
        o.pressure == pressure &&
        o.humidity == humidity;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
        feelsLike.hashCode ^
        tempMin.hashCode ^
        tempMax.hashCode ^
        pressure.hashCode ^
        humidity.hashCode;
  }

  @override
  String toString() {
    return 'Main(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity)';
  }
}

class Weather {
  Weather({
    @required this.id,
    @required this.main,
    @required this.description,
    @required this.icon,
  });

  final int id;
  final String main;
  final String description;
  final String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: (json['id'] as num).toInt(),
        main: json['main'] as String,
        description: json['description'] as String,
        icon: json['icon'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Weather &&
        o.id == id &&
        o.main == main &&
        o.description == description &&
        o.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^ main.hashCode ^ description.hashCode ^ icon.hashCode;
  }

  @override
  String toString() {
    return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
  }
}

class Clouds {
  Clouds({
    @required this.all,
  });

  final int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: (json['all'] as num).toInt(),
      );

  Map<String, dynamic> toJson() => {
        'all': all,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Clouds && o.all == all;
  }

  @override
  int get hashCode => all.hashCode;

  @override
  String toString() => 'Clouds(all: $all)';
}

class Wind {
  Wind({
    @required this.speed,
    @required this.deg,
  });

  final double speed;
  final int deg;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: (json['speed'] as num).toDouble(),
        deg: (json['deg'] as num).toInt(),
      );

  Map<String, dynamic> toJson() => {
        'speed': speed,
        'deg': deg,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Wind && o.speed == speed && o.deg == deg;
  }

  @override
  int get hashCode => speed.hashCode ^ deg.hashCode;

  @override
  String toString() => 'Wind(speed: $speed, deg: $deg)';
}
