import 'package:equatable/equatable.dart';

import '../core/prediccion.dart';
import 'value_objects.dart';

class Bajamar extends Prediccion {
  final DateTime hora;
  final Atmosfera atmosfera;
  final Cielo cielo;

  const Bajamar(
    this.hora,
    this.atmosfera,
    this.cielo,
  );

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Bajamar &&
        o.hora == hora &&
        o.atmosfera == atmosfera &&
        o.cielo == cielo;
  }

  @override
  int get hashCode => hora.hashCode ^ atmosfera.hashCode ^ cielo.hashCode;

  @override
  String toString() =>
      'Bajamar(hora: $hora, atmosfera: $atmosfera, cielo: $cielo)';

  Bajamar copyWith({
    DateTime hora,
    Atmosfera atmosfera,
    Cielo cielo,
  }) {
    return Bajamar(
      hora ?? this.hora,
      atmosfera ?? this.atmosfera,
      cielo ?? this.cielo,
    );
  }
}

class Cielo extends Equatable {
  final int id;
  final String descripcion;
  final Icono icono;

  const Cielo(
    this.id,
    this.descripcion,
    this.icono,
  );

  @override
  List<Object> get props => [id, descripcion, icono];

  @override
  bool get stringify => true;
}

class Icono extends Equatable {
  final String id;

  const Icono(this.id);

  Uri get uri => Uri(
        scheme: 'http',
        host: 'openweathermap.org',
        path: '/img/wn/$id@2x.png',
      );

  @override
  List<Object> get props => [id];

  @override
  bool get stringify => true;
}

class Atmosfera extends Equatable {
  final Temperatura temperatura;
  final Viento viento;

  const Atmosfera(this.temperatura, this.viento);

  @override
  List<Object> get props => [temperatura, viento];

  @override
  bool get stringify => true;
}

class Temperatura extends Equatable {
  final int temperatura;
  final int minima;
  final int maxima;

  const Temperatura(this.temperatura, this.minima, this.maxima);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => true;
}

class Viento extends Equatable {
  final int velocidad;
  final Direccion direccion;

  const Viento(this.velocidad, this.direccion);

  @override
  List<Object> get props => [velocidad, direccion];

  @override
  bool get stringify => true;
}
