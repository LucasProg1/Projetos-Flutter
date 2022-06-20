import 'package:flutter/material.dart';
import 'package:atvfinal/models/lote.dart';
import 'package:atvfinal/provider/lote_provider.dart';
import 'package:provider/provider.dart';

class FormLote extends StatefulWidget {
  @override
  State<FormLote> createState() => _FormLoteState();
}

class _FormLoteState extends State<FormLote> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Lote lote) {
    _formData['id'] = lote.id!;
    _formData['nome'] = lote.nome;
    _formData['capacidade'] = lote.capacidade;
    _formData['tamanho'] = lote.tamanho;
    _formData['ocupado'] = lote.ocupado;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final lote = ModalRoute.of(context)?.settings.arguments as Lote;
    _loadFormData(lote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Lote de Pastagens'),
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
                  TextFormField(
                    initialValue: _formData['nome'],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Preencha o Campo!';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['nome'] = value,
                    decoration: InputDecoration(
                      labelText: 'Identificação do Piquete',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    initialValue: _formData['capacidade'],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Preencha o Campo!';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['capacidade'] = value,
                    decoration: InputDecoration(
                      labelText: 'Capacidade suportada de Animais',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    initialValue: _formData['tamanho'],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Prencha o Campo!';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['tamanho'] = value,
                    decoration: InputDecoration(
                      labelText: 'Tamanho do piquete',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    initialValue: _formData['ocupado'],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Preencha o Campo!';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['ocupado'] = value,
                    decoration: InputDecoration(
                      labelText: 'Ocupação do Piquete',
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
                          Provider.of<LoteProvider>(context, listen: false).put(
                              Lote(
                                  id: _formData['id'],
                                  nome: _formData['nome']!,
                                  capacidade: _formData['capacidade']!,
                                  tamanho: _formData['tamanho']!,
                                  ocupado: _formData['ocupado']!));
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
