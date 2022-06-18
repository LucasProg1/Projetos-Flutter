import 'package:flutter/material.dart';
import 'package:flutter_projeto_1/components/user_tile.dart';
import 'package:flutter_projeto_1/models/user.dart';
import 'package:provider/provider.dart';
import '../provider/users.dart';
import '../routes/app_routes.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM,
                arguments: const User(
                  id: '',
                  name: '',
                  email: '',
                  avatarUrl: '',
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ), //cria uma lista de acordo com o numero de usuarios
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
