import 'package:flutter/material.dart';
import 'user_edit.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conta", textAlign: TextAlign.center),
        backgroundColor: Colors.grey,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Informações da conta: ",
                    style: TextStyle(fontSize: 30),
                  ),
                  InfoUser(),
                ],
              )),
          NavigationBarOrdem()
        ],
      ),
    );
  }
}

class EditarUser extends StatefulWidget {
  const EditarUser({super.key});

  @override
  State<EditarUser> createState() => _EditarUserState();
}

class _EditarUserState extends State<EditarUser> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Nome",
            style: TextStyle(fontSize: 20),
          ),
          Text("Usuário Teste"),
          Text(
            "Email",
            style: TextStyle(fontSize: 20),
          ),
          Text("teste@teste.com"),
          Text(
            "CPF",
            style: TextStyle(fontSize: 20),
          ),
          Text("000.000.000-00"),
          Text(
            "Telefone",
            style: TextStyle(fontSize: 20),
          ),
          Text("(99)99999-9999"),
          Text(
            "Placa de carro",
            style: TextStyle(fontSize: 20),
          ),
          Text("AAA0AAA"),
        ],
      ),
    );
  }
}

class NavigationBarOrdem extends StatefulWidget {
  const NavigationBarOrdem({super.key});

  @override
  State<NavigationBarOrdem> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarOrdem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UserEdit()));
              },
              child: const Row(
                children: [
                  Text(
                    "Editar",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(
                    Icons.edit,
                    size: 20,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
