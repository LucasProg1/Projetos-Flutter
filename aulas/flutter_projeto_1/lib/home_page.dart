import 'package:flutter/material.dart';
import 'package:flutter_projeto_1/app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    //responsavel por organizar os componentes
    return Scaffold(
        // header da pagina
        appBar: AppBar(
          title: Text(
            'App ADS',
          ),
          actions: [CustomSwitch()],
        ),
        //corpo da pagina
        body: Container(
          width: double.infinity,
          height: double.infinity,
          //rolagem infinita
          child: ListView(
            //scrollDirection: Axis.vertical, rolagem para baixo
            //scrollDirection: Axis.horizontal, rolagem para o lado
            //rolagem infinita
            children: [
              Center(child: CustomSwitch()),
              Container(
                //cria um retangulo invisivel
                height: 150,
              ),
              Row(
                // row é a forma de alinhar em linhas os elementos
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    //cria um retangulo
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.black,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.black,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              contador++;
            });
          },
          child: const Icon(Icons.add_circle),
        ));
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.isDark,
        onChanged: (value) {
          AppController.instance.changeTheme();
        });
  }
}
