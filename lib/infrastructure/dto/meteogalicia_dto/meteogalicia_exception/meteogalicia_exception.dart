import '../../data_transfer_object.dart';

class MeteogaliciaException extends DataTransferObject {
  final String _code;
  final String _message;

  String get code => _code;
  String get message => _message;

  MeteogaliciaException._(
    this._code,
    this._message,
  );

  factory MeteogaliciaException.fromjson(Map<String, dynamic> json) =>
      MeteogaliciaException._(
        json['exception']['code'] as String,
        json['exception']['message'] as String,
      );

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is MeteogaliciaException &&
        o._code == _code &&
        o._message == _message;
  }

  @override
  int get hashCode => _code.hashCode ^ _message.hashCode;

  @override
  String toString() =>
      'MeteogaliciaFailureDto(code: $_code, message: $_message)';
}
