import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ola_mundo/models/bov_compra.dart';

class BovCompraProvider with ChangeNotifier {
  final Map<String, BovCompra> _itens = {};

  List<BovCompra> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  BovCompra byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  void put(BovCompra bovCompra) {
    if (bovCompra == null) {
      return;
    }

    if (bovCompra.id != null &&
        bovCompra.id!.trim().isNotEmpty &&
        _itens.containsKey(bovCompra.id)) {
      _itens.update(
          bovCompra.id!,
          (_) => BovCompra(
              id: bovCompra.id,
              idBov: bovCompra.idBov,
              peso: bovCompra.peso,
              idade: bovCompra.idade,
              lote: bovCompra.lote,
              descri: bovCompra.descri,
              sexo: bovCompra.sexo));
    } else {
      final id = Random().nextDouble().toString();
      _itens.putIfAbsent(
          id,
          () => BovCompra(
              id: bovCompra.id,
              idBov: bovCompra.idBov,
              peso: bovCompra.peso,
              idade: bovCompra.idade,
              lote: bovCompra.lote,
              descri: bovCompra.descri,
              sexo: bovCompra.sexo));
    }
    notifyListeners();
  }

  void remove(BovCompra bovCompra) {
    if (bovCompra != null && bovCompra.id != null) {
      _itens.remove(bovCompra.id);
      notifyListeners();
    }
  }
}
