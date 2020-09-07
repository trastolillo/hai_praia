import 'package:flutter/foundation.dart';

import '../data_transfer_object.dart';

class SunriseSunsetDto extends DataTransferObject {
  SunriseSunsetDto({
    @required this.results,
    @required this.status,
  });

  final Results results;
  final String status;

  factory SunriseSunsetDto.fromJson(Map<String, dynamic> json) =>
      SunriseSunsetDto(
        results: Results.fromJson(json['results'] as Map<String, dynamic>),
        status: json['status'] as String,
      );

  Map<String, dynamic> toJson() => {
        'results': results.toJson(),
        'status': status,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SunriseSunsetDto && o.results == results && o.status == status;
  }

  @override
  int get hashCode => results.hashCode ^ status.hashCode;

  @override
  String toString() => 'SunriseSunsetDto(results: $results, status: $status)';
}

class Results {
  Results({
    @required this.sunrise,
    @required this.sunset,
    @required this.solarNoon,
    @required this.dayLength,
    @required this.civilTwilightBegin,
    @required this.civilTwilightEnd,
    @required this.nauticalTwilightBegin,
    @required this.nauticalTwilightEnd,
    @required this.astronomicalTwilightBegin,
    @required this.astronomicalTwilightEnd,
  });

  final String sunrise;
  final String sunset;
  final String solarNoon;
  final int dayLength;
  final String civilTwilightBegin;
  final String civilTwilightEnd;
  final String nauticalTwilightBegin;
  final String nauticalTwilightEnd;
  final String astronomicalTwilightBegin;
  final String astronomicalTwilightEnd;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        sunrise: json['sunrise'] as String,
        sunset: json['sunset'] as String,
        solarNoon: json['solar_noon'] as String,
        dayLength: (json['day_length'] as num).toInt(),
        civilTwilightBegin: json['civil_twilight_begin'] as String,
        civilTwilightEnd: json['civil_twilight_end'] as String,
        nauticalTwilightBegin: json['nautical_twilight_begin'] as String,
        nauticalTwilightEnd: json['nautical_twilight_end'] as String,
        astronomicalTwilightBegin:
            json['astronomical_twilight_begin'] as String,
        astronomicalTwilightEnd: json['astronomical_twilight_end'] as String,
      );

  Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
        "solar_noon": solarNoon,
        "day_length": dayLength,
        "civil_twilight_begin": civilTwilightBegin,
        "civil_twilight_end": civilTwilightEnd,
        "nautical_twilight_begin": nauticalTwilightBegin,
        "nautical_twilight_end": nauticalTwilightEnd,
        "astronomical_twilight_begin": astronomicalTwilightBegin,
        "astronomical_twilight_end": astronomicalTwilightEnd,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Results &&
        o.sunrise == sunrise &&
        o.sunset == sunset &&
        o.solarNoon == solarNoon &&
        o.dayLength == dayLength &&
        o.civilTwilightBegin == civilTwilightBegin &&
        o.civilTwilightEnd == civilTwilightEnd &&
        o.nauticalTwilightBegin == nauticalTwilightBegin &&
        o.nauticalTwilightEnd == nauticalTwilightEnd &&
        o.astronomicalTwilightBegin == astronomicalTwilightBegin &&
        o.astronomicalTwilightEnd == astronomicalTwilightEnd;
  }

  @override
  int get hashCode {
    return sunrise.hashCode ^
        sunset.hashCode ^
        solarNoon.hashCode ^
        dayLength.hashCode ^
        civilTwilightBegin.hashCode ^
        civilTwilightEnd.hashCode ^
        nauticalTwilightBegin.hashCode ^
        nauticalTwilightEnd.hashCode ^
        astronomicalTwilightBegin.hashCode ^
        astronomicalTwilightEnd.hashCode;
  }

  @override
  String toString() {
    return 'Results(sunrise: $sunrise, sunset: $sunset, solarNoon: $solarNoon, dayLength: $dayLength, civilTwilightBegin: $civilTwilightBegin, civilTwilightEnd: $civilTwilightEnd, nauticalTwilightBegin: $nauticalTwilightBegin, nauticalTwilightEnd: $nauticalTwilightEnd, astronomicalTwilightBegin: $astronomicalTwilightBegin, astronomicalTwilightEnd: $astronomicalTwilightEnd)';
  }
}
