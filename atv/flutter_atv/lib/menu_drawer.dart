import 'package:flutter/material.dart';
import 'package:ola_mundo/models/bov_compra.dart';
import 'package:ola_mundo/models/lote.dart';

import 'models/beznasc.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            // ClipOval(child: ...)
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  'https://media.istockphoto.com/photos/illustration-of-smiling-happy-man-with-laptop-sitting-in-armchair-picture-id1226886130?s=612x612'),
            ),
            accountName: Text('Lucas Brito'),
            accountEmail: Text('lucas@gmail.com'),
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text("Menu"),
              //subtitle: Text('Pagina inicial'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              }),
          ListTile(
              leading: Icon(Icons.person),
              title: Text("Perfil"),
              //subtitle: Text('Pagina inicial'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/perfil');
              }),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sair"),
              //subtitle: Text('Pagina inicial'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                    '/'); //arquivo para direcionar as outras paginas
              }),
        ],
      ),
    );
  }
}
