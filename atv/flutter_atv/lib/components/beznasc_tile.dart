import 'package:flutter/material.dart';
import 'package:ola_mundo/models/beznasc.dart';
import 'package:ola_mundo/provider/beznasc_provider.dart';
import 'package:provider/provider.dart';

class BezNascTile extends StatelessWidget {
  final Beznasc beznasc;

  const BezNascTile(this.beznasc);

  @override
  Widget build(BuildContext context) {
    //caso não tenha um endereço de uma imagem, pega um icone
    final bez = beznasc.foto == null || beznasc.foto!.isEmpty
        ? (Icon(Icons.android))
        : (Image.asset(beznasc.foto!));
    return ListTile(
      leading: bez,
      title: Text(beznasc.idBez),
      subtitle: Text(beznasc.descri),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/cadastroAnimalNasc',
                  arguments: beznasc,
                );
              },
              color: Colors.orange,
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir Animal Nascido'),
                    content: Text('Tem certeza?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Não'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      TextButton(
                        child: Text('Sim'),
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  ),
                ).then((confirmed) {
                  if (confirmed) {
                    Provider.of<BezNascProvider>(context, listen: false)
                        .remove(beznasc);
                  }
                });
              },
              color: Colors.red,
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
