import 'package:flutter/material.dart';
import 'package:ola_mundo/components/bovcompra_tile.dart';
import 'package:ola_mundo/provider/bovcompra_provider.dart';
import 'package:provider/provider.dart';

class BovCompraPage extends StatelessWidget {
  const BovCompraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BovCompraProvider bovCompraProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Animais Adultos'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/cadastroAnimalCompra');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: bovCompraProvider.count,
        itemBuilder: (ctx, i) => BovCompraTile(bovCompraProvider.byIndex(i)),
      ),
    );
  }
}
