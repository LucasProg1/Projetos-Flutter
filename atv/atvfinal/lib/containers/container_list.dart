import 'package:flutter/material.dart';

class ContainerList extends StatelessWidget {
  const ContainerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, bottom: 20, right: 10),
      child: Row(
        children: [
          Container(
            child: ListTile(
                leading: Icon(
                  Icons.assignment,
                  color: Color.fromARGB(255, 76, 185, 228),
                ),
                title: Text("Lista de Animais Nascidos"),
                onTap: () {
                  Navigator.of(context).pushNamed('/listaAnimalNasc');
                }),
            width: 215,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              child: ListTile(
                  leading: Icon(
                    Icons.assignment,
                    color: Color.fromARGB(255, 76, 185, 228),
                  ),
                  title: Text("Lista de Animais Adultos"),
                  //subtitle: Text('Pagina inicial'),
                  onTap: () {
                    Navigator.of(context).pushNamed('/listaAnimalComprado');
                  }),
              width: 215,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              child: ListTile(
                  leading: Icon(
                    Icons.assignment,
                    color: Color.fromARGB(255, 76, 185, 228),
                  ),
                  title: Text("Lista de Lote de Pastagens"),
                  //subtitle: Text('Pagina inicial'),
                  onTap: () {
                    Navigator.of(context).pushNamed('/listaLote');
                  }),
              width: 215,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }
}
