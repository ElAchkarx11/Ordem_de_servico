import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'ordem_page.dart';
import 'post.dart';
import 'process.dart';

Future<Post?>? post;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  int cont = 0;

  @override
  Widget build(BuildContext context) {
    //Pode usar material e Scaffold, a difrença é que o segundo cria um aplicativo pronto quase
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Barra(),
          const loginPage(),
          Container(
            width: double.infinity,
            height: 70,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      SizedBox(
          height: 500,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Colocar imagem

                  const Text(
                    "Sistema de O.S",
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Insira seu usuário',
                    ),
                  ),
                  TextFormField(
                    
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Insira sua senha',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.grey),
                    onPressed: () {
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OrdemPage()));
                      }
                      /*  FirebaseFirestore.instance
                          .collection("minha_colecao")
                          .add({'campo1': usuario, 'campo2': senha}); */
                      
                    },
                    child: const Text('Acessar'),
                  ),
                ]),
          )),
    ]);
  }
}

class Barra extends StatelessWidget {
  const Barra({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      color: Colors.grey,
    );
  }
}
