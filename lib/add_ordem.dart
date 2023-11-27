import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ola_mundo/ordem_edit.dart';
import 'ordem_page.dart';

//Essa é a página que faz com que as ordens de serviço sejam criadas e enviadas para o banco de dados(Firebase)

class AddOrdem extends StatelessWidget {
  const AddOrdem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //Define o título do Scaffold
          title: const Text("Abertura de O.S"),
          backgroundColor: Colors.grey,
        ),
        body:
            const Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                  //A solicitação e a prioridade foram incluidas em elementos separados, para uma melhor organização em uma futura alteração do elemento
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Prioridade()])),
        ]));
  }
}

class Prioridade extends StatefulWidget {
  const Prioridade({super.key});

  @override
  State<Prioridade> createState() => _PrioridadeState();
}

class _PrioridadeState extends State<Prioridade> {
  final _solicitacaoController = TextEditingController();
  String _prioridadeController = "";

  @override
  //Método utilizado para liberar memória alocada pelos Controllers
  void dispose() {
    _solicitacaoController.dispose();

    super.dispose();
  }

  Future verificandoVazio(){
    try{
      return addOrderDescription();
    }catch(error){
      return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Algo deu errado :("),
                  content: Text(error.toString()),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Ok"))
                  ],
                ));
    }
  }

//Adicionando a descição de ordem e a prioridade
  Future addOrderDescription() async {
    await FirebaseFirestore.instance.collection("ordens_servico").add({
      'descricao': _solicitacaoController.text.trim(),
      'prioridade': _prioridadeController,
      'matricula_user': '1'
    });
    // ignore: use_build_context_synchronously
    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrdemPage()));
  }

  Widget build(BuildContext context) {
    final dropValue = ValueNotifier("");
    final dropOpcoes = ["Baixa", "Média", "Alta"];

    return Column(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Solicitação: ",
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 120,
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  maxLines: 4,
                  controller: _solicitacaoController,
                  decoration: const InputDecoration(
                      hintText: "Digite aqui a sua solicitação..."),
                ),
              ))
        ],
      ),
      SizedBox(
        width: 100,
        height: 50,
        child: ValueListenableBuilder(
          valueListenable: dropValue,
          builder: (BuildContext context, String value, _) {
            return DropdownButtonFormField(
              hint: const Text("Selecione"),
              value: (value.isEmpty) ? null : value,
              onChanged: (escolha) => {_prioridadeController = escolha!},
              items: dropOpcoes
                  .map((op) => DropdownMenuItem(value: op, child: Text(op)))
                  .toList(),
            );
          },
        ),
      ),
      SizedBox(
        height: 100,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () {
                  verificandoVazio();
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
      )
    ]);
  }
}
