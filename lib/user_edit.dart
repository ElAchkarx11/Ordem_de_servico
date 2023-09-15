import 'package:flutter/material.dart';
import 'package:ola_mundo/ordem_page.dart';
import 'user_info.dart';


class UserEdit extends StatelessWidget {
  const UserEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar", textAlign: TextAlign.center),
        backgroundColor: Colors.blue,
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
          NavigationBarUser()
        ],
      ),
    );
  }
}

class InfoUser extends StatefulWidget {
  const InfoUser({super.key});

  @override
  State<InfoUser> createState() => _InfoUserState();
}

class _InfoUserState extends State<InfoUser> {
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

class NavigationBarUser extends StatefulWidget {
  const NavigationBarUser({super.key});

  @override
  State<NavigationBarUser> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarUser> {
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
                    MaterialPageRoute(builder: (context) => const OrdemPage()));
              },
              child: const Row(
                children: [
                  Text(
                    "Salvar",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(
                    Icons.save,
                    size: 20,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
