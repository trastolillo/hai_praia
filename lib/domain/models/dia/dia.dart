import 'package:flutter/material.dart';
import 'package:hai_praia/domain/models/marea/marea.dart';
import 'package:hai_praia/domain/models/prediccion.dart';
import 'package:hai_praia/domain/models/sol/ciclo_sol.dart';
import '../../core/date_utils.dart';

// TODO: test
class DiaDeMareas extends Prediccion {
  final DateTime _dia;
  final ListaMareas _mareas;
  final CicloSol _ciclosol;

  DiaDeMareas(
    this._dia,
    this._mareas,
    this._ciclosol,
  );

  DateTime get dia {
    return _dia.onlyDate;
  }

  ListaMareas get mareas {
    final mareas = _mareas.listaMareas
        .where((marea) => marea.repunte.hora.onlyDate == dia)
        .toList();
    return ListaMareas(listaMareas: mareas);
  }

  Sol get sol {
    return _ciclosol.solList
        .firstWhere((solItem) => solItem.amanecer.onlyDate == dia);
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is DiaDeMareas &&
        o._dia == _dia &&
        o._mareas == _mareas &&
        o._ciclosol == _ciclosol;
  }

  @override
  int get hashCode => _dia.hashCode ^ _mareas.hashCode ^ _ciclosol.hashCode;

  @override
  String toString() =>
      'DiaDeMareas(dia: $_dia, mareas: $_mareas, ciclosol: $_ciclosol)';
}
