import 'package:flutter/material.dart';
import 'package:ola_mundo/models/beznasc.dart';
import 'package:ola_mundo/models/bov_compra.dart';
import 'package:ola_mundo/models/lote.dart';

class ContainerForm extends StatelessWidget {
  const ContainerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, bottom: 20, right: 10),
      child: Row(
        children: [
          Container(
            child: ListTile(
                leading: Icon(
                  Icons.add_box,
                  color: Color.fromARGB(255, 226, 135, 16),
                ),
                title: Text("Cadastrar Parto"),
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
