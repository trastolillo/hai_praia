import 'package:flutter/foundation.dart' show required;
import 'package:hai_praia/domain/core/logger.dart';
import 'package:hai_praia/infrastructure/dto/openweather_dto/openweather_dto.dart';

class OpenweatherException extends OpenweatherDto {
  final Object cod;
  final String message;

  OpenweatherException({
    @required this.cod,
    @required this.message,
  });

  factory OpenweatherException.fromJson(Map<String, dynamic> json) {
    logger.d(json['cod']);
    return OpenweatherException(
      cod: json['cod'] is String
          ? json['cod'] as String
          : (json['cod'] as num).toInt(),
      message: json['message'] as String,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is OpenweatherException && o.cod == cod && o.message == message;
  }

  @override
  int get hashCode => cod.hashCode ^ message.hashCode;

  @override
  String toString() => 'OpenweatherException(cod: $cod, message: $message)';
}
