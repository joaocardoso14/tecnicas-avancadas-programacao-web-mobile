import 'package:flutter/material.dart';

// Exercício 1 — Cadastro de Veículo
// Crie uma tela para cadastrar um veículo contendo os seguintes campos:

// Marca;
// Modelo;
// Ano;
// Preço.
// Faça as seguintes validações:

// Marca
// Campo obrigatório;
// Deve possuir entre 2 e 50 caracteres.
// Modelo
// Campo obrigatório;
// Deve possuir entre 2 e 50 caracteres.
// Ano
// Campo obrigatório;
// Deve ser um número inteiro;
// Deve estar entre 1900 e 2026.
// Preço
// Campo obrigatório;
// Deve aceitar valores decimais utilizando ponto ou vírgula;
// Deve possuir no máximo duas casas decimais;
// Deve estar entre R$ 1.000,00 e R$ 1.000.000,00.
// Caso todos os dados estejam corretos, exiba:

// Veículo salvo com sucesso
class Exercicio1App extends StatelessWidget {
  const Exercicio1App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 1 - Cadastro de veículo',
      home: Exercicio1Page(),
    );
  }
}

class Exercicio1Page extends StatefulWidget {
  const Exercicio1Page({super.key});
  @override
  State<StatefulWidget> createState() {
    return Exercicio1State();
  }
}

class Exercicio1State extends State<Exercicio1Page> {
  
  TextEditingController marcaControlador = TextEditingController();
  TextEditingController modeloControlador = TextEditingController();
  TextEditingController anoControlador = TextEditingController();
  TextEditingController precoControlador = TextEditingController();

  String mensagem = '';

  void salvar() {
    String marca = marcaControlador.text.trim();
    String modelo = modeloControlador.text.trim();
    String ano = anoControlador.text.trim();
    String preco = precoControlador.text.trim();

    if (marca.isEmpty) {
      setState(() {
        mensagem = 'O campo marca é obrigatório';
      });
      return;
    }

    if (marca.length < 2 || marca.length > 50) {
      setState(() {
        mensagem = 'A marca deve ter entre 2 e 50 caracteres';
      });
      return;
    }

    if (modelo.isEmpty) {
      setState(() {
        mensagem = 'O campo modelo é obrigatório';
      });
      return;
    }

    if (modelo.length < 2 || modelo.length > 50) {
      setState(() {
        mensagem = 'O modelo deve ter entre 2 e 50 caracteres';
      });
      return;
    }
    

    if(ano.isEmpty) {
      setState(() {
        mensagem = 'O campo ano é obrigatório';
      });
      return;
    }

    int? anoConvertido = int.tryParse(ano);
    if (anoConvertido == null) {
      setState(() {
        mensagem = 'Informe um ano válido (apenas números inteiros)';
      });
      return;
    }

    if (anoConvertido < 1900 || anoConvertido > 2026) {
      setState(() {
        mensagem = 'O ano deve estar entre 1900 e 2026';
      });
      return;
    } 
  
    if (preco.isEmpty) {
      setState(() {
        mensagem = 'O campo preço é obrigatório';
      });
      return;
    }

     if (!RegExp(r'^\d+([,.]\d{1,2})?$').hasMatch(preco)) {
      setState(() {
        mensagem = 'O preço deve ter no máximo duas casas decimais';
      });
      return;
    }

    double? precoConvertido = double.tryParse(preco.replaceAll(',', '.'));
    if (precoConvertido == null) {
      setState(() {
        mensagem = 'Informe um preço válido';
      });
      return;
    }

    if (precoConvertido < 1000.00 || precoConvertido > 1000000.00) {
      setState(() {
        mensagem = 'O preço deve estar entre R\$ 1.000,00 e R\$ 1.000.000,00';
      });
      return;
    } 

    setState(() {
      mensagem = 'Veículo salvo com sucesso';
    });  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Veículo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: marcaControlador,
              decoration: InputDecoration(
                labelText: 'Marca do Veículo',
                hintText: 'Ex: Toyota',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: modeloControlador,
              decoration: InputDecoration(
                labelText: 'Modelo do Veículo',
                hintText: 'Ex: Corolla',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: anoControlador,
              decoration: InputDecoration(
                labelText: 'Ano do Veículo',
                hintText: 'Ex: 2020',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: precoControlador,
              decoration: InputDecoration(
                labelText: 'Preço do Veículo',
                hintText: 'Ex: 1200,00',
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