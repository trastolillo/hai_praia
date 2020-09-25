import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'package:hai_praia/domain/core/value_failures.dart';
import 'package:hai_praia/domain/models/marea/tabla_mareas.dart';
import 'package:hai_praia/domain/models/value_objects/value_validators.dart';

import '../prediccion.dart';

class ListaMareas extends Prediccion {
  final List<Marea> listaMareas;

  ListaMareas({
    this.listaMareas,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;  
    return o is ListaMareas &&
      listEquals(o.listaMareas, listaMareas);
  }

  @override
  int get hashCode => listaMareas.hashCode;

  @override
  String toString() => 'ListaMareas(listaMareas: $listaMareas)';
}

class Marea extends Prediccion {
  final Repunte repunte;
  final Atmosfera atmosfera;
  final Cielo cielo;

  Marea({
    @required this.repunte,
    @required this.atmosfera,
    @required this.cielo,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    {}
    return o is Marea &&
        o.repunte == repunte &&
        o.atmosfera == atmosfera &&
        o.cielo == cielo;
  }

  @override
  int get hashCode => repunte.hashCode ^ atmosfera.hashCode ^ cielo.hashCode;

  @override
  String toString() =>
      'Marea(repunte: $repunte, atmosfera: $atmosfera, cielo: $cielo)';
}

class Cielo {
  final int id;
  final String descripcion;
  final Icono icono;

  Cielo({
    @required this.id,
    @required this.descripcion,
    @required this.icono,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Cielo &&
        o.id == id &&
        o.descripcion == descripcion &&
        o.icono == icono;
  }

  @override
  int get hashCode => id.hashCode ^ descripcion.hashCode ^ icono.hashCode;

  @override
  String toString() =>
      'Cielo(id: $id, descripcion: $descripcion, icono: $icono)';
}

class Icono {
  final String id;

  Icono({@required this.id});

  Uri get uri => Uri(
        scheme: 'http',
        host: 'openweathermap.org',
        path: '/img/wn/$id@2x.png',
      );

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Icono && o.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Icono(id: $id)';
}

class Atmosfera {
  final Temperatura temperatura;
  final Viento viento;

  Atmosfera({
    @required this.temperatura,
    @required this.viento,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Atmosfera && o.temperatura == temperatura && o.viento == viento;
  }

  @override
  int get hashCode => temperatura.hashCode ^ viento.hashCode;

  @override
  String toString() => 'Atmosfera(temperatura: $temperatura, viento: $viento)';
}

class Temperatura {
  final int temperatura;
  final int minima;
  final int maxima;

  const Temperatura({
    @required this.temperatura,
    @required this.minima,
    @required this.maxima,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Temperatura &&
        o.temperatura == temperatura &&
        o.minima == minima &&
        o.maxima == maxima;
  }

  @override
  int get hashCode => temperatura.hashCode ^ minima.hashCode ^ maxima.hashCode;

  @override
  String toString() =>
      'Temperatura(temperatura: $temperatura, minima: $minima, maxima: $maxima)';
}

class Viento {
  final int velocidad;
  final Direccion direccion;

  const Viento({
    @required this.velocidad,
    @required this.direccion,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Viento && o.velocidad == velocidad && o.direccion == direccion;
  }

  @override
  int get hashCode => velocidad.hashCode ^ direccion.hashCode;

  @override
  String toString() => 'Viento(velocidad: $velocidad, direccion: $direccion)';
}

class Direccion {
  final int grados;

  Direccion({
    @required this.grados,
  });

  Either<ValueFailure<String>, String> get puntoCardinal =>
      fromDegreeToCardinal(grados);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Direccion && o.grados == grados;
  }

  @override
  int get hashCode => grados.hashCode;

  @override
  String toString() => 'Direccion(grados: $grados)';
}
