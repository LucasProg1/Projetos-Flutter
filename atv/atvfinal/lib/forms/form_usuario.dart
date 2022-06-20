import 'package:flutter/material.dart';
import 'package:atvfinal/models/usuario.dart';
import 'package:atvfinal/provider/usuario_provider.dart';
import 'package:provider/provider.dart';

class FormUser extends StatefulWidget {
  @override
  State<FormUser> createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Usuario usuario) {
    _formData['id'] = usuario.id!;
    _formData['email'] = usuario.email;
    _formData['senha'] = usuario.senha;
  }

  String senhaConf = "";

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 50,
                child: Image.asset('assets/images/logo2.png'),
              ),
              Container(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                child: Form(
                  key: _form,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 12, right: 12, top: 15),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Preencha o Campo!';
                            }
                            return null;
                          },
                          onChanged: (value) => _formData['email'] = value,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Preencha o Campo!';
                            }
                            return null;
                          },
                          onChanged: (value) => _formData['senha'] = value,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, bottom: 15),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Preencha o Campo!';
                            }
                            return null;
                          },
                          onChanged: (text) => senhaConf = text,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Confirme a Senha',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    final isValid = _form.currentState!.validate();

                    if ((isValid) && (_formData['senha'] == senhaConf)) {
                      _form.currentState!.save();
                      Provider.of<UsuarioProvider>(context, listen: false).put(
                          Usuario(
                              id: _formData['id'],
                              email: _formData['email']!,
                              senha: _formData['senha']!));
                      Navigator.of(context).pushNamed('/home');
                    }
                  },
                  child: Text('Salvar')),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  'Já possui conta? Faça login!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/');
                  },
                  child: Text('Login')),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // aqui ele empilha os componentes
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/tema.png',
                fit: BoxFit.cover,
              )),
          Container(color: Colors.black.withOpacity(0.36)),
          _body(),
        ],
      ),
    );
  }
}
