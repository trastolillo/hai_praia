import 'package:hai_praia/domain/models/marea/marea.dart';
import 'package:hai_praia/domain/models/prediccion.dart';

class DiaDeMareas extends Prediccion {
  final DateTime dia;
  final ListaMareas mareas; // TODO: Esto es un getter
  final CicloSol ciclosol; // TODO: Esto es un getter

  DiaDeMareas({
    this.dia,
    this.mareas,
    this.ciclosol,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is DiaDeMareas &&
        o.dia == dia &&
        o.mareas == mareas &&
        o.ciclosol == ciclosol;
  }

  @override
  int get hashCode => dia.hashCode ^ mareas.hashCode ^ ciclosol.hashCode;

  @override
  String toString() =>
      'DiaDeMareas(dia: $dia, mareas: $mareas, ciclosol: $ciclosol)';
}

class CicloSol {
  DateTime amanecer;
  DateTime ocaso;
  CicloSol({
    this.amanecer,
    this.ocaso,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is CicloSol && o.amanecer == amanecer && o.ocaso == ocaso;
  }

  @override
  int get hashCode => amanecer.hashCode ^ ocaso.hashCode;

  @override
  String toString() => 'CicloSol(amanecer: $amanecer, ocaso: $ocaso)';
}
