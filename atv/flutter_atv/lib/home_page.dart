// sempre se cria uma classe que vai dentro da classe StateFul
import 'package:flutter/material.dart';
import 'package:ola_mundo/containers/container_forms.dart';
import 'package:ola_mundo/containers/container_list.dart';
import 'app_controller.dart';
import 'menu_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String nome = 'Colors.green';
  @override
  Widget build(BuildContext context) {
    // podemos usar Scaffold ou material

    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text('BR-Manejo'),
        actions: [CustomSwitch()],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Column(
              children: [
                Container(
                  child: Center(child: ContainerForm()),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Container(
                  child: Center(child: ContainerList()),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                )
                /*Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Text(
                    "Anotações",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),*/
              ],
            ),
          ],
        ),
      ),

      // passando botao
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle),
        //vamos passar a funcao contar
        onPressed: () {
          Navigator.of(context).pushNamed('/formdrawer');
        },
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
