import 'package:flutter/material.dart';

// Exercício 5 — Cadastro de Evento
// Crie uma tela para cadastrar um evento contendo os seguintes campos:

// Nome do evento;
// Quantidade mínima de participantes;
// Quantidade máxima de participantes;
// Valor do ingresso.
// Faça as seguintes validações:

// Nome do evento
// Campo obrigatório;
// Deve possuir entre 5 e 100 caracteres.
// Quantidade mínima de participantes
// Campo obrigatório;
// Deve ser um número inteiro;
// Não pode ser menor que 1.
// Quantidade máxima de participantes
// Campo obrigatório;
// Deve ser um número inteiro;
// Deve estar entre 1 e 50.000;
// Não pode ser menor que a quantidade mínima de participantes.
// Valor do ingresso
// Campo obrigatório;
// Deve aceitar números decimais utilizando vírgula ou ponto;
// Deve possuir no máximo duas casas decimais;
// Deve estar entre R$ 0,00 e R$ 10.000,00.
// Caso todos os dados estejam corretos, exiba:

// Evento salvo com sucesso

class Exercicio5App extends StatelessWidget {
  const Exercicio5App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 5 - Cadastro de evento',
      home: Exercicio5Page(),
    );
  }
}

class Exercicio5Page extends StatefulWidget {
  const Exercicio5Page({super.key});
  @override
  State<StatefulWidget> createState() {
    return Exercicio5State();
  }
}

class Exercicio5State extends State<Exercicio5Page> {
  
  TextEditingController nomeControlador = TextEditingController();
  TextEditingController quantidadeMinimaControlador = TextEditingController();
  TextEditingController quantidadeMaximaControlador = TextEditingController();
  TextEditingController valorIngressoControlador = TextEditingController();

  String mensagem = '';

  void salvar() {
    String nome = nomeControlador.text.trim();
    String quantidadeMinima = quantidadeMinimaControlador.text.trim();
    String quantidadeMaxima = quantidadeMaximaControlador.text.trim();
    String valorIngresso = valorIngressoControlador.text.trim();

    if (nome.isEmpty) {
      setState(() {
        mensagem = 'O campo nome é obrigatório';
      });
      return;
    }

    if (nome.length < 5 || nome.length > 100) {
      setState(() {
        mensagem = 'O nome deve ter entre 5 e 100 caracteres';
      });
      return;
    }
  
    if (valorIngresso.isEmpty) {
      setState(() {
        mensagem = 'O campo valor do ingresso é obrigatório';
      });
      return;
    }

     if (!RegExp(r'^\d+([,.]\d{1,2})?$').hasMatch(valorIngresso)) {
      setState(() {
        mensagem = 'O valor do ingresso deve ter no máximo duas casas decimais';
      });
      return;
    }

    double? valorConvertido = double.tryParse(valorIngresso.replaceAll(',', '.'));
    if (valorConvertido == null) {
      setState(() {
        mensagem = 'Informe um valor de ingresso válido';
      });
      return;
    }

    if (valorConvertido < 0.10 || valorConvertido > 1000) {
      setState(() {
        mensagem = 'O valor do ingresso deve estar entre R\$ 0,10 e R\$ 1000,00';
      });
      return;
    } 

    if(quantidadeMinima.isEmpty) {
      setState(() {
        mensagem = 'O campo quantidade mínima é obrigatório';
      });
      return;
    }

    int? quantidadeMinimaConvertida = int.tryParse(quantidadeMinima);
    if (quantidadeMinimaConvertida == null) {
      setState(() {
        mensagem = 'Informe uma quantidade mínima válida';
      });
      return;
    }

    if (quantidadeMaxima.isEmpty) {
      setState(() {
        mensagem = 'O campo quantidade máxima é obrigatório';
      });
      return;
    }

    int? quantidadeMaximaConvertida = int.tryParse(quantidadeMaxima);
    if (quantidadeMaximaConvertida == null) {
      setState(() {
        mensagem = 'Informe uma quantidade máxima válida';
      });
      return;
    }

    if (quantidadeMinimaConvertida > quantidadeMaximaConvertida) {
      setState(() {
        mensagem = 'A quantidade mínima não pode ser maior que a quantidade máxima';
      });
      return;
    } 

    setState(() {
      mensagem = 'Produto salvo com sucesso';
    });  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Evento'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: nomeControlador,
              decoration: InputDecoration(
                labelText: 'Nome do Evento',
                hintText: 'Ex: Show de Rock',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: valorIngressoControlador,
              decoration: InputDecoration(
                labelText: 'Preço do Evento',
                hintText: 'Ex: 12,50',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: quantidadeMinimaControlador,
              decoration: InputDecoration(
                labelText: 'Quantidade Mínima',
                hintText: 'Ex: 10',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: quantidadeMaximaControlador,
              decoration: InputDecoration(
                labelText: 'Quantidade Máxima',
                hintText: 'Ex: 100',
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