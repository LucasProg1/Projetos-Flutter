import 'package:flutter/material.dart';
import 'package:ola_mundo/models/bov_compra.dart';
import 'package:ola_mundo/models/lote.dart';

import 'models/beznasc.dart';

class FormDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
              leading: Icon(
                Icons.add_box,
                color: Color.fromARGB(255, 226, 135, 16),
              ),
              title: Text("Cadastrar Parto"),
              //subtitle: Text('Pagina inicial'),
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/cadastroAnimalNasc',
                  //essa parte é necessária devido o carregamento de dados no _loadFormData,
                  arguments: const Beznasc(
                      id: '',
                      idBez: '',
                      idMatriz: '',
                      dataNasc: '',
                      lote: '',
                      descri: '',
                      idRepro: '',
                      sexo: ''),
                );
              }),
          ListTile(
              leading: Icon(
                Icons.add_box,
                color: Color.fromARGB(255, 226, 135, 16),
              ),
              title: Text("Cadastrar Animal"),
              //subtitle: Text('Pagina inicial'),
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/cadastroAnimalCompra',
                  arguments: const BovCompra(
                      id: '',
                      idBov: '',
                      peso: '',
                      idade: '',
                      lote: '',
                      descri: '',
                      sexo: ''),
                );
              }),
          ListTile(
              leading: Icon(
                Icons.add_box,
                color: Color.fromARGB(255, 226, 135, 16),
              ),
              title: Text("Cadastrar Lote de Pastagem"),
              //subtitle: Text('Pagina inicial'),
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/cadastroLote',
                  arguments: const Lote(
                      id: '',
                      nome: '',
                      capacidade: '',
                      tamanho: '',
                      ocupado: ''),
                );
              }),
          ListTile(
              leading: Icon(
                Icons.assignment,
                color: Color.fromARGB(255, 76, 185, 228),
              ),
              title: Text("Lista de Animais Nascidos"),
              //subtitle: Text('Pagina inicial'),
              onTap: () {
                Navigator.of(context).pushNamed('/listaAnimalNasc');
              }),
          ListTile(
              leading: Icon(
                Icons.assignment,
                color: Color.fromARGB(255, 76, 185, 228),
              ),
              title: Text("Lista de Animais Adultos"),
              //subtitle: Text('Pagina inicial'),
              onTap: () {
                Navigator.of(context).pushNamed('/listaAnimalComprado');
              }),
          ListTile(
              leading: Icon(
                Icons.assignment,
                color: Color.fromARGB(255, 76, 185, 228),
              ),
              title: Text("Lista de Lote de Pastagens"),
              //subtitle: Text('Pagina inicial'),
              onTap: () {
                Navigator.of(context).pushNamed('/listaLote');
              }),
        ],
      ),
    );
  }
}
