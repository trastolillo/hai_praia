class SunriseSunsetException {
  final String _status;

  SunriseSunsetException(this._status);

  String get status => _status;

  factory SunriseSunsetException.fromJson(Map<String, dynamic> json) =>
      SunriseSunsetException(json['status'] as String);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SunriseSunsetException && o._status == _status;
  }

  @override
  int get hashCode => _status.hashCode;

  @override
  String toString() => 'SunriseSunsetException(status: $_status)';
}
