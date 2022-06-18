import 'package:flutter/material.dart';
import 'package:ola_mundo/provider/beznasc_provider.dart';
import 'package:provider/provider.dart';

import '../components/beznasc_tile.dart';

class BezNascPage extends StatelessWidget {
  const BezNascPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BezNascProvider bezNascProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Bezerros Nascidos'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/cadastroAnimalNasc');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: bezNascProvider.count,
        itemBuilder: (ctx, i) => BezNascTile(bezNascProvider.byIndex(i)),
      ),
    );
  }
}
