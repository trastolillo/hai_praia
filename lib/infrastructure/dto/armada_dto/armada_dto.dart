import 'package:flutter/foundation.dart';

import '../data_transfer_object.dart';

class ArmadaDto extends DataTransferObject {
  ArmadaDto({
    @required this.puerto,
    @required this.fecha,
    @required this.ndatos,
    @required this.values,
    @required this.hours,
  });

  final String puerto;
  final String fecha;
  final String ndatos;
  final List<double> values;
  final List<String> hours;

  factory ArmadaDto.fromJson(Map<String, dynamic> json) => ArmadaDto(
        puerto: json['puerto'] as String,
        fecha: json['fecha'] as String,
        ndatos: json['ndatos'] as String,
        values: (json['values'] as List<dynamic>)
            .map((e) => (e as num).toDouble())
            .toList(),
        hours:
            (json['hours'] as List<dynamic>).map((e) => e.toString()).toList(),
      );

  Map<String, dynamic> toJson() => {
        'puerto': puerto,
        'fecha': fecha,
        'ndatos': ndatos,
        'values': values,
        'hours': hours,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ArmadaDto &&
        o.puerto == puerto &&
        o.fecha == fecha &&
        o.ndatos == ndatos &&
        listEquals(o.values, values) &&
        listEquals(o.hours, hours);
  }

  @override
  int get hashCode {
    return puerto.hashCode ^
        fecha.hashCode ^
        ndatos.hashCode ^
        values.hashCode ^
        hours.hashCode;
  }

  @override
  String toString() {
    return 'ArmadaDto(puerto: $puerto, fecha: $fecha, ndatos: $ndatos, values: $values, hours: $hours)';
  }
}
