import 'package:flutter/material.dart';
import 'package:flutter_projeto_1/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String senha = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          //combobox
          width: MediaQuery.of(context).size.width, //tamanho
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                    'https://th.bing.com/th/id/OIP.ZWQrkH0Gv7Scj4fSbU6w9QHaHa?w=219&h=220&c=7&r=0&o=5&pid=1.7'),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  onChanged: (text) => email = text,
                  //label lembra o html
                  keyboardType: TextInputType.emailAddress, //tipo do campo
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                    onChanged: (text) => senha = text,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                    )),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (email == 'lucas@gmail.com' && senha == '123') {
                        //Navigator.of(context).pushNamed('/home'); // cria um botão para voltar automaticamente
                        // sem botao de voltar
                        Navigator.of(context).pushReplacementNamed('/home');
                      }
                    },
                    child: Text('Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
