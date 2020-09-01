import 'package:flutter/foundation.dart' show required;

class Sys {
  Sys({
    @required this.type,
    @required this.id,
    @required this.country,
    @required this.sunrise,
    @required this.sunset,
  });

  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: (json['type'] as num).toInt(),
        id: (json['id'] as num).toInt(),
        country: json['country'] as String,
        sunrise: (json['sunrise'] as num).toInt(),
        sunset: (json['sunset'] as num).toInt(),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Sys &&
        o.type == type &&
        o.id == id &&
        o.country == country &&
        o.sunrise == sunrise &&
        o.sunset == sunset;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        id.hashCode ^
        country.hashCode ^
        sunrise.hashCode ^
        sunset.hashCode;
  }

  @override
  String toString() {
    return 'Sys(type: $type, id: $id, country: $country, sunrise: $sunrise, sunset: $sunset)';
  }
}
