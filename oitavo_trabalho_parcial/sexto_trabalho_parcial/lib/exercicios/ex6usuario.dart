import 'package:flutter/material.dart';

// Exercício 6 — Cadastro de Usuário
// Crie uma tela para cadastro de usuário contendo os seguintes campos:

// Nome;
// E-mail;
// Senha;
// Confirmar senha.
// Faça as seguintes validações:

// Nome
// Campo obrigatório;
// Deve possuir entre 3 e 50 caracteres.
// E-mail
// Campo obrigatório;
// Deve conter @;
// Deve conter pelo menos um . após o @.
// Senha
// Campo obrigatório;
// Deve possuir entre 6 e 20 caracteres.
// Confirmar senha
// Campo obrigatório;
// Deve possuir exatamente o mesmo valor informado no campo senha.
// Caso as senhas sejam diferentes, exiba uma mensagem adequada.

// Caso todos os dados estejam corretos, exiba:

// Usuário cadastrado com sucesso

class Exercicio6App extends StatelessWidget {
  const Exercicio6App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 6 - Cadastro de usuário',
      home: Exercicio6Page(),
    );
  }
}

class Exercicio6Page extends StatefulWidget {
  const Exercicio6Page({super.key});
  @override
  State<StatefulWidget> createState() {
    return Exercicio6State();
  }
}

class Exercicio6State extends State<Exercicio6Page> {
  
  TextEditingController nomeControlador = TextEditingController();
  TextEditingController emailControlador = TextEditingController();
  TextEditingController senhaControlador = TextEditingController();
  TextEditingController confirmarSenhaControlador = TextEditingController();

  String mensagem = '';

  void salvar() {
    String nome = nomeControlador.text.trim();
    String email = emailControlador.text.trim();
    String senha = senhaControlador.text.trim();
    String confirmarSenha = confirmarSenhaControlador.text.trim();

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
  
    if (email.isEmpty) {
      setState(() {
        mensagem = 'O campo e-mail é obrigatório';
      });
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email)) {
      setState(() {
        mensagem = 'Informe um e-mail válido (ex: joao.silva@example.com)';
      });
      return;
    }

    if (senha.isEmpty) {
      setState(() {
        mensagem = 'O campo senha é obrigatório';
      });
      return;
    }

    if (senha.length < 6 || senha.length > 20) {
      setState(() {
        mensagem = 'A senha deve ter entre 6 e 20 caracteres';
      });
      return;
    }

    if (confirmarSenha.isEmpty) {
      setState(() {
        mensagem = 'O campo confirmar senha é obrigatório';
      });
      return;
    }

    if (senha != confirmarSenha) {
      setState(() {
        mensagem = 'As senhas não coincidem';
      });
      return;
    }

    setState(() {
      mensagem = 'Usuário salvo com sucesso';
    });  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: nomeControlador,
              decoration: InputDecoration(
                labelText: 'Nome do Usuário',
                hintText: 'Ex: João da Silva',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: emailControlador,
              decoration: InputDecoration(
                labelText: 'E-mail',
                hintText: 'Ex: joao.silva@example.com',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: senhaControlador,
              decoration: InputDecoration(
                labelText: 'Senha',
                hintText: 'Ex: ********',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: confirmarSenhaControlador,
              decoration: InputDecoration(
                labelText: 'Confirmar Senha',
                hintText: 'Ex: ********',
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