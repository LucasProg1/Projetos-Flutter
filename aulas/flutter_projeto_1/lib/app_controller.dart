import 'package:flutter/material.dart';

//classe que resposável pela mudança
class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDark = false; //controla o tema da aplicação
  changeTheme() {
    isDark = !isDark; // o tema simplesmente vai ser diferente do anterior
    notifyListeners();
  }
}
