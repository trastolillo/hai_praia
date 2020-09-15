abstract class DataTransferObject {
  const DataTransferObject();
}

class DataTransferObjectException extends DataTransferObject {
  final int status;
  final String message;

  DataTransferObjectException({this.status, this.message});

  factory DataTransferObjectException.empty() =>
      DataTransferObjectException(message: '', status: -1);

  factory DataTransferObjectException.fromJson(Map<String, dynamic> json) =>
      DataTransferObjectException(
        status: (json['status'] as num).toInt(),
        message: json['message'] as String ?? '',
      );

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is DataTransferObjectException &&
        o.status == status &&
        o.message == message;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode;

  @override
  String toString() =>
      'DataTransferObjectException(status: $status, message: $message)';
}
