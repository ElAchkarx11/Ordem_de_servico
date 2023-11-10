import 'package:flutter/material.dart';
import 'ordem_edit.dart';

class OrdemInfo extends StatelessWidget {
  const OrdemInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Visualizar O.S"),
          backgroundColor: Colors.grey,
        ),
        body: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Solicitacao(), Prioridade(), Estado()])),
              NavigationBarOS()
            ]));
  }
}

class Solicitacao extends StatelessWidget {
  const Solicitacao({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Solicitação: ",
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 100,
            width: double.infinity,
            child: 
  
              Text("Descrição de ordem de serviço..."),
            )
      ],
    );
  }
}

class Prioridade extends StatelessWidget {
  const Prioridade({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Prioridade",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 100,
              height: 30,
              child: Text("Baixa"),
            )
          ],
        ));
  }
}

class Estado extends StatelessWidget {
  const Estado({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    const Padding(padding: EdgeInsets.symmetric(vertical: 10), 
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Estado",
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 100,
          height: 30,
          child: Text("Em curso"),
        )
      ],
    ));
    
    
  }
}

class NavigationBarOS extends StatefulWidget {
  const NavigationBarOS({super.key});

  @override
  State<NavigationBarOS> createState() => _NavigationBarOSState();
}

class _NavigationBarOSState extends State<NavigationBarOS> {
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
                    MaterialPageRoute(builder: (context) => const OrdemEdit()));
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
