import 'package:flutter/foundation.dart';

class Crs {
  Crs({
    @required this.type,
    @required this.properties,
  });

  final String type;
  final CrsProperties properties;

  factory Crs.fromJson(Map<String, dynamic> json) => Crs(
        type: json['type'] as String,
        properties: CrsProperties.fromJson(
          json['properties'] as Map<String, dynamic>,
        ),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'properties': properties.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Crs && o.type == type && o.properties == properties;
  }

  @override
  int get hashCode => type.hashCode ^ properties.hashCode;

  @override
  String toString() => 'Crs(type: $type, properties: $properties)';
}

class CrsProperties {
  CrsProperties({
    @required this.name,
  });

  final String name;

  factory CrsProperties.fromJson(Map<String, dynamic> json) =>
      CrsProperties(name: json['name'] as String);

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CrsProperties && o.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => 'CrsProperties(name: $name)';
}

class Feature {
  Feature({
    @required this.type,
    @required this.geometry,
    @required this.properties,
  });

  final String type;
  final Geometry geometry;
  final FeatureProperties properties;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        type: json['type'] as String,
        geometry: Geometry.fromjson(json['geometry'] as Map<String, dynamic>),
        properties: FeatureProperties.fromJson(
            json['properties'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'geometry': geometry.toJson(),
        'properties': properties.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Feature &&
        o.type == type &&
        o.geometry == geometry &&
        o.properties == properties;
  }

  @override
  int get hashCode => type.hashCode ^ geometry.hashCode ^ properties.hashCode;

  @override
  String toString() =>
      'Feature(type: $type, geometry: $geometry, properties: $properties)';
}

class Geometry {
  Geometry({
    @required this.type,
    @required this.coordinates,
  });

  final String type;
  final List<double> coordinates;

  factory Geometry.fromjson(Map<String, dynamic> json) => Geometry(
        type: json['type'] as String,
        coordinates: json['point'] as List<double>,
      );

  Map<String, dynamic> toJson() => {
        'type': type ?? '',
        'coordinates': coordinates ?? [0.0, 0.0],
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Geometry &&
        o.type == type &&
        listEquals(o.coordinates, coordinates);
  }

  @override
  int get hashCode => type.hashCode ^ coordinates.hashCode;

  @override
  String toString() => 'Geometry(type: $type, coordinates: $coordinates)';
}

class FeatureProperties {
  FeatureProperties({
    @required this.id,
    @required this.name,
    @required this.municipality,
    @required this.province,
    @required this.type,
    @required this.port,
    @required this.referencePort,
    @required this.days,
  });

  final String id;
  final String name;
  final String municipality;
  final String province;
  final String type;
  final Port port;
  final Port referencePort;
  final List<Day> days;

  factory FeatureProperties.fromJson(Map<String, dynamic> json) =>
      FeatureProperties(
        id: json['id'] as String,
        name: json['name'] as String,
        municipality: json['municipality'] as String,
        province: json['province'] as String,
        type: json['type'] as String,
        port: Port.fromJson(json['port'] as Map<String, dynamic>),
        referencePort:
            Port.fromJson(json['referencePort'] as Map<String, dynamic>),
        days: (json['days'] as List<dynamic>)
            .map((e) => Day.fromJson(e as Map<String, dynamic>))
            .toList(),
        // TODO quitar este null
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'municipality': municipality,
        'province': province,
        'type': type,
        'port': port.toJson(),
        'referencePort': referencePort.toJson(),
        'days': days.map((day) => day.toJson()),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FeatureProperties &&
        o.id == id &&
        o.name == name &&
        o.municipality == municipality &&
        o.province == province &&
        o.type == type &&
        o.port == port &&
        o.referencePort == referencePort &&
        listEquals(o.days, days);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        municipality.hashCode ^
        province.hashCode ^
        type.hashCode ^
        port.hashCode ^
        referencePort.hashCode ^
        days.hashCode;
  }

  @override
  String toString() {
    return 'FeatureProperties(id: $id, name: $name, municipality: $municipality, province: $province, type: $type, port: $port, referencePort: $referencePort, days: $days)';
  }
}

class Day {
  Day({
    @required this.timePeriod,
    @required this.variables,
  });

  final TimePeriod timePeriod;
  final List<Variable> variables;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
      timePeriod:
          TimePeriod.fromJson(json['timePeriod'] as Map<String, dynamic>),
      variables: (json['variables'] as List<dynamic>)
          .map((e) => Variable.fromJson(e as Map<String, dynamic>))
          .toList());

  Map<String, dynamic> toJson() => {
        'timePeriod': timePeriod.toJson(),
        'variables': variables.map((variable) => variable.toJson()).toList(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Day &&
        o.timePeriod == timePeriod &&
        listEquals(o.variables, variables);
  }

  @override
  int get hashCode => timePeriod.hashCode ^ variables.hashCode;

  @override
  String toString() => 'Day(timePeriod: $timePeriod, variables: $variables)';
}

class TimePeriod {
  TimePeriod({
    @required this.begin,
    @required this.end,
  });

  final Begin begin;
  final Begin end;

  factory TimePeriod.fromJson(Map<String, dynamic> json) => TimePeriod(
        begin: Begin.fromJson(json['begin'] as Map<String, dynamic>),
        end: Begin.fromJson(json['end'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'begin': begin.toJson(),
        'end': end.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is TimePeriod && o.begin == begin && o.end == end;
  }

  @override
  int get hashCode => begin.hashCode ^ end.hashCode;

  @override
  String toString() => 'TimePeriod(begin: $begin, end: $end)';
}

class Begin {
  Begin({
    @required this.timeInstant,
  });

  final String timeInstant;

  factory Begin.fromJson(Map<String, dynamic> json) =>
      Begin(timeInstant: json['timeInstant'] as String);

  Map<String, dynamic> toJson() => {
        'timeInstant': timeInstant,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Begin && o.timeInstant == timeInstant;
  }

  @override
  int get hashCode => timeInstant.hashCode;

  @override
  String toString() => 'Begin(timeInstant: $timeInstant)';
}

class Variable {
  Variable({
    @required this.name,
    @required this.units,
    @required this.summary,
    @required this.values,
  });

  final String name;
  final String units;
  final List<Summary> summary;
  final List<Value> values;

  factory Variable.fromJson(Map<String, dynamic> json) => Variable(
        name: json['name'] as String,
        units: json['units'] as String,
        summary: (json['summary'] as List<dynamic>)
            .map((summaryItem) =>
                Summary.fromJson(summaryItem as Map<String, dynamic>))
            .toList(),
        values: (json['values'] as List<dynamic>)
            .map((valueItem) =>
                Value.fromJson(valueItem as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'units': units,
        'summary': summary.map((e) => e.toJson()).toList(),
        'values': values.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Variable &&
        o.name == name &&
        o.units == units &&
        listEquals(o.summary, summary) &&
        listEquals(o.values, values);
  }

  @override
  int get hashCode {
    return name.hashCode ^ units.hashCode ^ summary.hashCode ^ values.hashCode;
  }

  @override
  String toString() {
    return 'Variable(name: $name, units: $units, summary: $summary, values: $values)';
  }
}

class Summary {
  Summary({
    @required this.id,
    @required this.state,
    @required this.timeInstant,
    @required this.height,
  });

  final String id;
  final String state;
  final String timeInstant;
  final double height;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
      id: json['id'] as String,
      state: json['state'] as String,
      timeInstant: json['timeInstant'] as String,
      height: (json['height'] as num).toDouble());

  Map<String, dynamic> toJson() => {
        'id': id,
        'state:': state,
        'timeInstant': timeInstant,
        'height': height,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Summary &&
        o.id == id &&
        o.state == state &&
        o.timeInstant == timeInstant &&
        o.height == height;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        state.hashCode ^
        timeInstant.hashCode ^
        height.hashCode;
  }

  @override
  String toString() {
    return 'Summary(id: $id, state: $state, timeInstant: $timeInstant, height: $height)';
  }
}

enum State { lowTides, highTides }

class Value {
  Value({
    @required this.timeInstant,
    @required this.height,
  });

  final String timeInstant;
  final double height;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        timeInstant: json['timeInstant'] as String,
        height: (json['height'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'timeInstant': timeInstant,
        'height': height,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Value && o.timeInstant == timeInstant && o.height == height;
  }

  @override
  int get hashCode => timeInstant.hashCode ^ height.hashCode;

  @override
  String toString() => 'Value(timeInstant: $timeInstant, height: $height)';
}

class Port {
  Port({
    @required this.id,
    @required this.name,
    @required this.geometry,
  });

  final String id;
  final String name;
  final Geometry geometry;

  factory Port.fromJson(Map<String, dynamic> json) => Port(
        id: json['id'] as String,
        name: json['name'] as String,
        geometry: Geometry.fromjson(json['geometry'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'geometry': geometry.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Port && o.id == id && o.name == name && o.geometry == geometry;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ geometry.hashCode;
}
