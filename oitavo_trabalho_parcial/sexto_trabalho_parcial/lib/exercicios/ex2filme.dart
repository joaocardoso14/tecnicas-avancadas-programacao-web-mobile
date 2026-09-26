import 'package:flutter/material.dart';

// Exercício 2 — Cadastro de Filme
// Crie uma tela para cadastro de um filme contendo os seguintes campos:

// Nome do filme;
// Data de lançamento;
// Duração em minutos.
// Faça as seguintes validações:

// Nome do filme
// Campo obrigatório;
// Deve possuir entre 2 e 100 caracteres.
// Data de lançamento
// Campo obrigatório;
// Deve estar no formato dd/mm/aaaa.
// Exemplos válidos:

// 15/08/2020
// 01/01/1995

// Exemplos inválidos:

// 15-08-2020
// 2020/08/15
// 1/1/2020

// Utilize uma expressão regular para verificar se a data foi informada no formato correto.

// Duração
// Campo obrigatório;
// Deve ser um número inteiro;
// Deve estar entre 1 e 500 minutos.
// Caso todos os dados estejam corretos, exiba:

// Filme salvo com sucesso

class Exercicio2App extends StatelessWidget {
  const Exercicio2App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 2 - Cadastro de filme',
      home: Exercicio2Page(),
    );
  }
}

class Exercicio2Page extends StatefulWidget {
  const Exercicio2Page({super.key});
  @override
  State<StatefulWidget> createState() {
    return Exercicio2State();
  }
}

class Exercicio2State extends State<Exercicio2Page> {
  
  TextEditingController nomeControlador = TextEditingController();
  TextEditingController dataControlador = TextEditingController();
  TextEditingController duracaoControlador = TextEditingController();

  String mensagem = '';

  void salvar() {
    String nome = nomeControlador.text.trim();
    String data = dataControlador.text.trim();
    String duracao = duracaoControlador.text.trim();

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
  
    if (data.isEmpty) {
      setState(() {
        mensagem = 'O campo data é obrigatório';
      });
      return;
    }

    if (!RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(data)) {
      setState(() {
        mensagem = 'A data deve estar no formato dd/mm/aaaa';
      });
      return;
    }

    if (duracao.isEmpty) {
      setState(() {
        mensagem = 'O campo duração é obrigatório';
      });
      return;
    }

    int? duracaoConvertida = int.tryParse(duracao);
    if (duracaoConvertida == null) {
      setState(() {
        mensagem = 'Informe uma duração válida';
      });
      return;
    }

    if (duracaoConvertida < 1 || duracaoConvertida > 500) {
      setState(() {
        mensagem = 'A duração deve estar entre 1 e 500 minutos';
      });
      return;
    } 

    setState(() {
      mensagem = 'Filme salvo com sucesso';
    });  
      return;
    }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Filmes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: nomeControlador,
              decoration: InputDecoration(
                labelText: 'Nome do Filme',
                hintText: 'Ex: O Poderoso Chefão',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: dataControlador,
              decoration: InputDecoration(
                labelText: 'Data de Lançamento',
                hintText: 'Ex: 15/08/2020',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: duracaoControlador,
              decoration: InputDecoration(
                labelText: 'Duração do Filme',
                hintText: 'Ex: 150 min',
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