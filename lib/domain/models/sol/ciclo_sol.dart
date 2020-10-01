import 'package:flutter/foundation.dart';

import '../prediccion.dart';

class CicloSol extends Prediccion {
  final List<Sol> solList;
  CicloSol({
    @required this.solList,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CicloSol && listEquals(o.solList, solList);
  }

  @override
  int get hashCode => solList.hashCode;

  @override
  String toString() => 'CicloSol(solList: $solList)';
}

class Sol {
  final DateTime amanecer;
  final DateTime ocaso;
  Sol({
    @required this.amanecer,
    @required this.ocaso,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Sol && o.amanecer == amanecer && o.ocaso == ocaso;
  }

  @override
  int get hashCode => amanecer.hashCode ^ ocaso.hashCode;

  @override
  String toString() => 'CicloSol(amanecer: $amanecer, ocaso: $ocaso)';
}
