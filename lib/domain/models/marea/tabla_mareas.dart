import 'package:flutter/foundation.dart';
import 'package:hai_praia/domain/core/enums.dart';

class TablaMareas {
  final List<Repunte> repuntes;

  TablaMareas({
    @required this.repuntes,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is TablaMareas && listEquals(o.repuntes, repuntes);
  }

  @override
  int get hashCode => repuntes.hashCode;

  @override
  String toString() => 'TablaMareas(tabla: $repuntes)';
}

class Repunte {
  final DateTime hora;
  final double valor;

  const Repunte({
    @required this.hora,
    @required this.valor,
  });

  TipoRepunte get tipoRepunte =>
      valor > 2.2 ? TipoRepunte.pleamar : TipoRepunte.bajamar;

  bool get isBajamar => tipoRepunte == TipoRepunte.bajamar;

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
