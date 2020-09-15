import 'package:flutter/foundation.dart';
import 'package:hai_praia/domain/core/enums.dart';

class TablaMareas {
  final List<Repunte> tabla;

  TablaMareas({
    @required this.tabla,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is TablaMareas && listEquals(o.tabla, tabla);
  }

  @override
  int get hashCode => tabla.hashCode;

  @override
  String toString() => 'TablaMareas(tabla: $tabla)';
}

class Repunte {
  final DateTime hora;
  final double valor;

  Repunte({
    @required this.hora,
    @required this.valor,
  });

  TipoRepunte get tipoRepunte =>
      valor > 2.2 ? TipoRepunte.pleamar : TipoRepunte.bajamar;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Repunte && o.valor == valor && o.hora == hora;
  }

  @override
  int get hashCode => valor.hashCode ^ hora.hashCode;

  @override
  String toString() => 'Repunte(valor: $valor, hora: $hora)';
}
