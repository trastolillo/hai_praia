abstract class DataTransferObject {}

class DataTransferObjectException {
  final int status;

  DataTransferObjectException({
    this.status,
  });

  factory DataTransferObjectException.fromJson(Map<String, dynamic> json) =>
      DataTransferObjectException(status: (json['status'] as num).toInt());
}
