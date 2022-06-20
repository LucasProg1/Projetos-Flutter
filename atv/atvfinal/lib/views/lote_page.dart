import 'package:flutter/material.dart';
import 'package:atvfinal/components/lote_tile.dart';
import 'package:atvfinal/provider/lote_provider.dart';
import 'package:provider/provider.dart';

class LotePage extends StatelessWidget {
  const LotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoteProvider loteProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Lotes de Pastagens'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/cadastroLote');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: loteProvider.count,
        itemBuilder: (ctx, i) => LoteTile(loteProvider.byIndex(i)),
      ),
    );
  }
}
