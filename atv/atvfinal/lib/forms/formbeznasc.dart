import 'package:flutter/material.dart';
import 'package:atvfinal/models/beznasc.dart';
import 'package:provider/provider.dart';
import '../provider/beznasc_provider.dart';

class FormBeznasc extends StatefulWidget {
  @override
  State<FormBeznasc> createState() => _FormBeznascState();
}

class _FormBeznascState extends State<FormBeznasc> {
  // possibilitar acesso aos dados do formulario
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Beznasc beznasc) {
    //método para carregar os dados já cadastrados
    if (beznasc != null) {
      _formData['id'] = beznasc.id!;
      _formData['idBez'] = beznasc.idBez;
      _formData['idMatriz'] = beznasc.idMatriz;
      _formData['dataNasc'] = beznasc.dataNasc;
      _formData['lote'] = beznasc.lote;
      _formData['descri'] = beznasc.descri;
      _formData['sexo'] = beznasc.sexo;
      _formData['idRepro'] = beznasc.idRepro;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final beznasc = ModalRoute.of(context)?.settings.arguments as Beznasc;
    _loadFormData(beznasc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Animais Nascidos'),
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
                    initialValue: _formData['idBez'],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Preencha o Campo!';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['idBez'] = value,
                    decoration: InputDecoration(
                      labelText: 'Identificação do Bezerro',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    initialValue: _formData['idMatriz'],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Preencha o Campo!';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['idMatriz'] = value,
                    decoration: InputDecoration(
                      labelText: 'Identificação da Matriz',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    initialValue: _formData['dataNasc'],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Prencha o Campo!';
                      }

                      if (value.trim().length < 8) {
                        return 'Informe uma Data Correta!';
                      }

                      return null;
                    },
                    onChanged: (value) => _formData['dataNasc'] = value,
                    decoration: InputDecoration(
                      labelText: 'Data de Nascimento',
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
                        return 'Informe algumas características do bezerro: Cor, Raça!';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['descri'] = value,
                    decoration: InputDecoration(
                      labelText: 'Descrição do Bezerro',
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
                    height: 15,
                  ),
                  TextFormField(
                    initialValue: _formData['idRepro'],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Preencha o Campo!';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['idRepro'] = value,
                    decoration: InputDecoration(
                      labelText: 'Identificação do Reprodutor',
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
                          Provider.of<BezNascProvider>(context, listen: false)
                              .put(Beznasc(
                                  id: _formData['id'],
                                  idBez: _formData['idBez']!,
                                  idMatriz: _formData['idMatriz']!,
                                  dataNasc: _formData['dataNasc']!,
                                  lote: _formData['lote']!,
                                  descri: _formData['descri']!,
                                  idRepro: _formData['idRepro']!,
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
