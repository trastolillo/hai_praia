import 'package:flutter/foundation.dart' show required;
import 'package:flutter/foundation.dart';

import '../openweather_dto.dart';
import 'sub_dto/sub_dto.dart';

class OpenweatherPrediccionDto extends OpenweatherDto {
  OpenweatherPrediccionDto({
    @required this.cod,
    @required this.message,
    @required this.cnt,
    @required this.list,
    @required this.city,
  });

  final String cod;
  final int message;
  final int cnt;
  final List<ListElement> list;
  final City city;

  factory OpenweatherPrediccionDto.fromJson(Map<String, dynamic> json) =>
      OpenweatherPrediccionDto(
        cod: json['cod'] as String,
        message: (json['message'] as num).toInt(),
        cnt: (json['cnt'] as num).toInt(),
        list: (json['list'] as List<dynamic>)
            .map((e) => ListElement.fromJson(e as Map<String, dynamic>))
            .toList(),
        city: City.fromJson(json['city'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'cod': cod,
        'message': message,
        'cnt': cnt,
        'list': list.map((e) => e.toJson()).toList(),
        'city': city.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is OpenweatherPrediccionDto &&
        o.cod == cod &&
        o.message == message &&
        o.cnt == cnt &&
        listEquals(o.list, list) &&
        o.city == city;
  }

  @override
  int get hashCode {
    return cod.hashCode ^
        message.hashCode ^
        cnt.hashCode ^
        list.hashCode ^
        city.hashCode;
  }

  @override
  String toString() {
    return 'OpenweatherPrediccionDto(cod: $cod, message: $message, cnt: $cnt, list: $list, city: $city)';
  }
}
