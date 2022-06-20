import 'dart:math';

import 'package:flutter/material.dart';
import 'package:atvfinal/models/usuario.dart';

class UsuarioProvider with ChangeNotifier {
  final Map<String, Usuario> _itens = {};

  List<Usuario> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  Usuario byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  void put(Usuario usuario) {
    if (usuario == null) {
      return;
    }
    final id = Random().nextDouble().toString();
    _itens.putIfAbsent(
        id,
        () => Usuario(
            id: usuario.id, email: usuario.email, senha: usuario.senha));
  }

  notifyListeners();
}
