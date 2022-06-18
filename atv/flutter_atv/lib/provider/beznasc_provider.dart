import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ola_mundo/data/dummy_beznasc.dart';
import 'package:ola_mundo/models/beznasc.dart';

class BezNascProvider with ChangeNotifier {
  final Map<String, Beznasc> _itens = {...DUMMY_BEZNASC};

  List<Beznasc> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  Beznasc byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  void put(Beznasc beznasc) {
    if (beznasc == null) {
      return;
    }

    if (beznasc.id != null &&
        beznasc.id!.trim().isNotEmpty &&
        _itens.containsKey(beznasc.id)) {
      _itens.update(
          beznasc.id!,
          (_) => Beznasc(
              id: beznasc.id,
              idBez: beznasc.idBez,
              idMatriz: beznasc.idMatriz,
              dataNasc: beznasc.dataNasc,
              lote: beznasc.lote,
              descri: beznasc.descri,
              idRepro: beznasc.idRepro,
              sexo: beznasc.sexo));
    } else {
      final id = Random().nextDouble().toString();
      _itens.putIfAbsent(
          id,
          () => Beznasc(
              id: id,
              idBez: beznasc.idBez,
              idMatriz: beznasc.idMatriz,
              dataNasc: beznasc.dataNasc,
              lote: beznasc.lote,
              descri: beznasc.descri,
              idRepro: beznasc.idRepro,
              sexo: beznasc.sexo));
    }
    notifyListeners();
  }

  void remove(Beznasc beznasc) {
    if (beznasc != null && beznasc.id != null) {
      _itens.remove(beznasc.id);
      notifyListeners();
    }
  }
}
