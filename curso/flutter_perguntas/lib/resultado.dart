import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function() quandorReiniciarQuestionario;

  Resultado(this.nota, this.quandorReiniciarQuestionario);

  String get fraseNota {
    if (nota < 8) {
      return 'Parabéns';
    } else if (nota < 12) {
      return 'Você é bom!';
    } else if (nota < 16) {
      return 'Impressionte!';
    } else {
      return 'Nivel Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseNota,
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
          onPressed: quandorReiniciarQuestionario,
          child: Text(
            'Reiniciar',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
