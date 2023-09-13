import 'package:flutter/material.dart';
import 'package:ordem_servico/add_ordem.dart';
import 'user_info.dart';
import 'ordem_info.dart';


class OrdemPage extends StatelessWidget {
  const OrdemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bem vindo"),
          backgroundColor: Colors.blue,
        ),
        body: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(children: [
                    Text(
                      "Suas Ordens de serviço:",
                      style: TextStyle(fontSize: 30, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    OrdemDisplay()
                  ])),
              NavigationBar()
            ]));
  }
}

class OrdemDisplay extends StatelessWidget {
  const OrdemDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        color: Colors.grey,
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const OrdemInfo()));
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Descrição: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text("Descrição da ordem de serviço",  style: TextStyle( color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Estado: Planejada",  style: TextStyle( color: Colors.white)),
                    Text("Prioridade: Alta",  style: TextStyle( color: Colors.white))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key});

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddOrdem()));
              },
              child: const Icon(
                Icons.add,
                size: 30,
              )),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UserInfo()));
              },
              child: const Icon(
                Icons.person,
                size: 30,
              )),
        ],
      ),
    );
  }
}
