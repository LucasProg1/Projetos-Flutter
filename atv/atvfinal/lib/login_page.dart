import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String senha = "";

  get child => null;

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
              Card(
                child: Padding(
                  //padding: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 20, bottom: 12),

                  child: Column(
                    children: [
                      TextField(
                        onChanged: (text) => email = text,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (text) => senha = text,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                color: Color.fromARGB(255, 201, 198, 198),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  if (email == 'lucas@gmail' && senha == '123') {
                    Navigator.of(context).pushNamed('/home');
                  } else {
                    print('Login Errado');
                  }
                },
                child: Container(
                  child: Text('Login'),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Text(
                  'Não Possui Login? Cadastre-se Abaixo!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/cadastroUsuario',
                  );
                },
                child: Container(
                  child: Text('Cadastre-se'),
                ),
              )
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
