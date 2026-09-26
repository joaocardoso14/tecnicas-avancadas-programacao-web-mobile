import 'package:flutter/material.dart';

// Exercício 3 — Cadastro de Aluno
// Crie uma tela para cadastro de um aluno contendo os seguintes campos:

// Nome;
// Idade;
// E-mail.
// Faça as seguintes validações:

// Nome
// Campo obrigatório;
// Deve possuir entre 3 e 50 caracteres.
// Idade
// Campo obrigatório;
// Deve ser um número inteiro;
// Deve estar entre 10 e 100.
// E-mail
// Campo obrigatório;
// Deve conter o caractere @.
// Caso todos os dados estejam corretos, exiba:

// Aluno salvo com sucesso

class Exercicio3App extends StatelessWidget {
  const Exercicio3App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 3 - Cadastro de aluno',
      home: Exercicio3Page(),
    );
  }
}

class Exercicio3Page extends StatefulWidget {
  const Exercicio3Page({super.key});
  @override
  State<StatefulWidget> createState() {
    return Exercicio3State();
  }
}

class Exercicio3State extends State<Exercicio3Page> {
  
  TextEditingController nomeControlador = TextEditingController();
  TextEditingController idadeControlador = TextEditingController();
  TextEditingController emailControlador = TextEditingController();

  String mensagem = '';

  void salvar() {
    String nome = nomeControlador.text.trim();
    String idade = idadeControlador.text.trim();
    String email = emailControlador.text.trim();

    if (nome.isEmpty) {
      setState(() {
        mensagem = 'O campo nome é obrigatório';
      });
      return;
    }

    if (nome.length < 3 || nome.length > 50) {
      setState(() {
        mensagem = 'O nome deve ter entre 3 e 50 caracteres';
      });
      return;
    }

    if(idade.isEmpty) {
      setState(() {
        mensagem = 'O campo idade é obrigatório';
      });
      return;
    }

    int? idadeConvertida = int.tryParse(idade);
    if (idadeConvertida == null) {
      setState(() {
        mensagem = 'Informe uma idade válida';
      });
      return;
    }

    if (idadeConvertida < 10 || idadeConvertida > 100) {
      setState(() {
        mensagem = 'A idade deve estar entre 10 e 100';
      });
      return;
    }

    if(email.isEmpty) {
      setState(() {
        mensagem = 'O campo e-mail é obrigatório';
      });
      return;
    }

    if (!email.contains('@')) {
      setState(() {
        mensagem = 'O e-mail deve conter o caractere @';
      });
      return;
    } 

    setState(() {
      mensagem = 'Aluno salvo com sucesso';
    });  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Aluno'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: nomeControlador,
              decoration: InputDecoration(
                labelText: 'Nome do Aluno',
                hintText: 'Ex: João da Silva',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: idadeControlador,
              decoration: InputDecoration(
                labelText: 'Idade do Aluno',
                hintText: 'Ex: 25',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: emailControlador,
              decoration: InputDecoration(
                labelText: 'E-mail do Aluno',
                hintText: 'Ex: joao.silva@example.com',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            Text(mensagem),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: salvar, 
              child: Text('Salvar'),
            ),
          ],
        ),
      )
    );
  }

}