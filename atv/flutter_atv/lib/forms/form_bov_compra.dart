import 'package:flutter/material.dart';
import 'package:ola_mundo/models/bov_compra.dart';
import 'package:provider/provider.dart';
import '../provider/bovcompra_provider.dart';

class FormBovCompra extends StatefulWidget {
  @override
  State<FormBovCompra> createState() => _FormBovCompraState();
}

class _FormBovCompraState extends State<FormBovCompra> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(BovCompra bovCompra) {
    if (bovCompra != null) {
      _formData['id'] = bovCompra.id!;
      _formData['idBov'] = bovCompra.idBov;
      _formData['peso'] = bovCompra.peso;
      _formData['idade'] = bovCompra.idade;
      _formData['lote'] = bovCompra.lote;
      _formData['descri'] = bovCompra.descri;
      _formData['sexo'] = bovCompra.sexo;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final bovCompra = ModalRoute.of(context)?.settings.arguments as BovCompra;
    _loadFormData(bovCompra);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Animais Adultos'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _form,
            //combobox
            // width: MediaQuery.of(context).size.width, //tamanho
            //height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
                  TextFormField(
                    initialValue: _formData['idBov'],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Preencha o Campo!';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['idBov'] = value,
                    decoration: InputDecoration(
                      labelText: 'Identificação do Animal',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    initialValue: _formData['peso'],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Preencha o Campo!';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['peso'] = value,
                    decoration: InputDecoration(
                      labelText: 'Peso do Animal',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    initialValue: _formData['idade'],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Prencha o Campo!';
                      }

                      if (value.trim().length < 5) {
                        return 'Informe uma Idade Correta!';
                      }

                      return null;
                    },
                    onChanged: (value) => _formData['idade'] = value,
                    decoration: InputDecoration(
                      labelText: 'Idade do Animal',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    initialValue: _formData['lote'],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Preencha o Campo!';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['lote'] = value,
                    decoration: InputDecoration(
                      labelText: 'Lote',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    initialValue: _formData['descri'],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Preencha o Campo!';
                      }

                      if (value.trim().length < 10) {
                        return 'Informe algumas características do bovino: Cor, Raça!';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['descri'] = value,
                    decoration: InputDecoration(
                      labelText: 'Descrição do Animal',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    initialValue: _formData['sexo'],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Preencha o Campo!';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['sexo'] = value,
                    decoration: InputDecoration(
                      labelText: 'Sexo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final isValid = _form.currentState!.validate();

                        if (isValid) {
                          _form.currentState!.save();
                          Provider.of<BovCompraProvider>(context, listen: false)
                              .put(BovCompra(
                                  id: _formData['id'],
                                  idBov: _formData['idBov']!,
                                  peso: _formData['peso']!,
                                  idade: _formData['idade']!,
                                  lote: _formData['lote']!,
                                  descri: _formData['descri']!,
                                  sexo: _formData['sexo']!));
                          Navigator.of(context).pop(); //para voltar
                        }
                      },
                      child: Text('Salvar'))
                ],
              ),
            ),
          ),
        ));
  }
}
