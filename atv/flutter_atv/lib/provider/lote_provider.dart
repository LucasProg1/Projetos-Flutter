import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ola_mundo/data/dummy_lote.dart';
import 'package:ola_mundo/models/lote.dart';

class LoteProvider with ChangeNotifier {
  final Map<String, Lote> _itens = {...DUMMY_lOTE};

  List<Lote> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  Lote byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  void put(Lote lote) {
    if (lote == null) {
      return;
    }

    if (lote.id != null &&
        lote.id!.trim().isNotEmpty &&
        _itens.containsKey(lote.id)) {
      _itens.update(
          lote.id!,
          (_) => Lote(
              id: lote.id,
              nome: lote.nome,
              capacidade: lote.capacidade,
              tamanho: lote.tamanho,
              ocupado: lote.ocupado));
    } else {
      final id = Random().nextDouble().toString();
      _itens.putIfAbsent(
          id,
          () => Lote(
              id: lote.id,
              nome: lote.nome,
              capacidade: lote.capacidade,
              tamanho: lote.tamanho,
              ocupado: lote.ocupado));
    }
    notifyListeners();
  }

  void remove(Lote lote) {
    if (lote != null && lote.id != null) {
      _itens.remove(lote.id);
      notifyListeners();
    }
  }
}
