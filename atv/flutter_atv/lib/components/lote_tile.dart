import 'package:flutter/material.dart';
import 'package:ola_mundo/models/lote.dart';
import 'package:ola_mundo/provider/lote_provider.dart';
import 'package:provider/provider.dart';

class LoteTile extends StatelessWidget {
  final Lote lote;
  const LoteTile(this.lote);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.fence_sharp),
      title: Text(lote.nome),
      subtitle: Text(lote.ocupado),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/cadastroLote',
                  arguments: lote,
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
                    title: Text('Excluir Lote'),
                    content: Text('Tem certeza???'),
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
                    Provider.of<LoteProvider>(context, listen: false)
                        .remove(lote);
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
