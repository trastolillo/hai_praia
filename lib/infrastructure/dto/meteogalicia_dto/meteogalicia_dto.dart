import 'package:flutter/foundation.dart';

import 'sub_dto/sub_dto.dart';

class MeteogaliciaDto {
  MeteogaliciaDto({
    @required this.type,
    @required this.crs,
    @required this.features,
  });

  final String type;
  final Crs crs;
  final List<Feature> features;

  factory MeteogaliciaDto.fromJson(Map<String, dynamic> json) =>
      MeteogaliciaDto(
        type: json['type'] as String,
        crs: Crs.fromJson(json['crs'] as Map<String, dynamic>),
        features: (json['features'] as List<dynamic>)
            .map((e) => Feature.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'crs': crs.toJson(),
        'features': features.map((feature) => feature.toJson()).toList(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is MeteogaliciaDto &&
        o.type == type &&
        o.crs == crs &&
        listEquals(o.features, features);
  }

  @override
  int get hashCode => type.hashCode ^ crs.hashCode ^ features.hashCode;

  @override
  String toString() =>
      'MeteogaliciaDto(type: $type, crs: $crs, features: $features)';
}
