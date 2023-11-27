import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'ordem_page.dart';
import 'post.dart';
import 'process.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _matriculaController = TextEditingController();
  final _carroController = TextEditingController();
  final _senhaController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _userController = TextEditingController();

  @override
  //Método utilizado para liberar memória alocada pelos Controllers
  void dispose() {
    _cpfController.dispose();
    _emailController.dispose();
    _matriculaController.dispose();
    _carroController.dispose();
    _senhaController.dispose();
    _telefoneController.dispose();
    _userController.dispose();

    super.dispose();
  }

  Future createUser() async {
    try {
//Criando o usuário
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          //Trim = utilizado para tirar espaços em branco e "Tabs"

          email: _emailController.text.trim(),
          password: _senhaController.text.trim());

      //Adicionando detalhes do usuário
      addUserDetails(
          _cpfController.text.trim(),
          _emailController.text.trim(),
          _matriculaController.text.trim(),
          _carroController.text.trim(),
          _telefoneController.text.trim(),
          _userController.text.trim(),
          _senhaController.text.trim());

      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const OrdemPage()));
    } catch (error) {
      // ignore: use_build_context_synchronously
      showDialog(
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

  Future addUserDetails(String CPF, String email, String matricula,
      String placa, String telefone, String usuario, senha) async {
    await FirebaseFirestore.instance.collection('minha_colecao').add({
      'CPF': CPF,
      'email': email,
      'matricula': matricula,
      'placa_carro': placa,
      'telefone': telefone,
      'usuario': usuario,
      'senha': senha
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Define o título do Scaffold
        title: const Text("Criação de usuário"),
        backgroundColor: Colors.grey,
      ),
      body: Material(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
              height: 600,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      //Usuário TextFormField
                      TextFormField(
                        controller: _userController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Insira o usuário',
                        ),
                      ),
                      //email TextFormField
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Insira o email',
                        ),
                      ),
                      //matricula TextFormField
                      TextFormField(
                        controller: _matriculaController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Insira a matricula',
                        ),
                      ),
                      //Carro TextFormField
                      TextFormField(
                        controller: _carroController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Insira a placa do carro(N obrigatorio)',
                        ),
                      ),
                      //senha TextFormField
                      TextFormField(
                        controller: _senhaController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Insira a senha',
                        ),
                      ),
                      //telefone TextFormField
                      TextFormField(
                        controller: _telefoneController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Insira o telefone',
                        ),
                      ),
                      //CPF TextFormField
                      TextFormField(
                        controller: _cpfController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Insira o CPF',
                        ),
                      ),

                      //Botão de ativação
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
                          createUser();
                        },
                        child: const Text('Acessar'),
                      ),
                    ]),
              )),
        ]),
      ),
    );
  }
}
