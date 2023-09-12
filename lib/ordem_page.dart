import 'package:flutter/material.dart';

class OrdemPage extends StatelessWidget {
  const OrdemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bem vindo"),
          backgroundColor: Colors.blue,
        ),
        body: const SizedBox(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(children: [
                Text(
                  "Suas Ordens de serviço:",
                  style: TextStyle(fontSize: 30, color: Colors.grey),
                ),
                SizedBox(height: 10,),
                OrdemDisplay()
              ])),
        ));
  }
}

class OrdemDisplay extends StatelessWidget {
  const OrdemDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        color: Colors.grey,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Descrição: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("Descrição da ordem de serviço"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text("Estado: Planejada"), Text("Prioridade: Alta")],
              )
            ],
          ),
        ));
  }
}
