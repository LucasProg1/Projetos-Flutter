import 'package:flutter/material.dart';
import 'package:atvfinal/components/bovcompra_tile.dart';
import 'package:atvfinal/provider/bovcompra_provider.dart';
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
