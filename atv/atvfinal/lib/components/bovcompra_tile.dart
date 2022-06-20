import 'package:flutter/material.dart';
import 'package:atvfinal/models/bov_compra.dart';
import '../provider/bovcompra_provider.dart';
import 'package:provider/provider.dart';

class BovCompraTile extends StatelessWidget {
  final BovCompra bovCompra;
  const BovCompraTile(this.bovCompra);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(bovCompra.idBov),
      subtitle: Text(bovCompra.descri),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/cadastroAnimalCompra',
                  arguments: bovCompra,
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
                    title: Text('Excluir Animal'),
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
                    Provider.of<BovCompraProvider>(context, listen: false)
                        .remove(bovCompra);
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
