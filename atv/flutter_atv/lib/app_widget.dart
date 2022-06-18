import 'package:flutter/material.dart';
import 'package:ola_mundo/form_drawer.dart';
import 'package:ola_mundo/forms/form_lote.dart';
import 'package:ola_mundo/forms/form_usuario.dart';
import 'package:ola_mundo/models/usuario.dart';
import 'package:ola_mundo/perfil_page.dart';
import 'package:ola_mundo/provider/beznasc_provider.dart';
import 'package:ola_mundo/provider/bovcompra_provider.dart';
import 'package:ola_mundo/provider/lote_provider.dart';
import 'package:ola_mundo/provider/usuario_provider.dart';
import 'package:ola_mundo/views/beznasc_page.dart';
import 'package:ola_mundo/views/bovcompra_page.dart';
import 'package:ola_mundo/views/lote_page.dart';
import 'package:provider/provider.dart';
// import a nova class gerada
import 'app_controller.dart';
import 'forms/form_bov_compra.dart';
import 'forms/formbeznasc.dart';
import 'home_page.dart';
import 'login_page.dart';

class AppWidget extends StatelessWidget {
  get arguments => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (BuildContext context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (ctx) => BezNascProvider(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => BovCompraProvider(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => LoteProvider(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => UsuarioProvider(),
            ),
          ],
          child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.green,
              brightness: AppController.instance.isDarkTheme
                  ? Brightness.dark // if e
                  : Brightness.light, //else
              //cor dos botões
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 15, 139, 15),
              )),
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => LoginPage(),
              '/home': (context) => HomePage(),
              '/perfil': (context) => PerfilPage(),
              '/cadastroAnimalNasc': (context) => FormBeznasc(),
              '/cadastroAnimalCompra': (context) => FormBovCompra(),
              '/cadastroLote': (context) => FormLote(),
              '/cadastroUsuario': (context) => FormUser(),
              '/listaAnimalNasc': (context) => BezNascPage(),
              '/listaAnimalComprado': (context) => BovCompraPage(),
              '/listaLote': (context) => LotePage(),
              '/formdrawer': (context) => FormDrawer(),
            },
          ),
        );
      },
    );
  }
}

// primarySwatch: Colors.green,
// brightness: Brightness.dark,
