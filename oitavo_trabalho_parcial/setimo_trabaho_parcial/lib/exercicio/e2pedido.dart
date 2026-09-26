import 'package:flutter/material.dart';

class AppPedido extends StatelessWidget {
  const AppPedido({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Pedido',
      home: PedidoPage(),
    );
  }
}

class PedidoPage extends StatefulWidget {
  const PedidoPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return PedidoState();
  }
}

class PedidoState extends State<PedidoPage> {
  TextEditingController nomeControlador = TextEditingController();
  TextEditingController valorControlador = TextEditingController();
  TextEditingController quantidadeControlador = TextEditingController();
  TextEditingController descontoControlador = TextEditingController();

  GlobalKey<FormState> formularioChave = GlobalKey<FormState>(); 

  String? validarNome (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo nome é obrigatório';
    }

    if (valor.length < 3 || valor.length > 60) {
      return 'O nome deve ter entre 3 e 60 caracteres';
    }

    return null;
  }

  String? validarValor (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo preço é obrigatório';
    }

    double? valorConvertido = double.tryParse(valor.replaceAll(',', '.'));
    if (valorConvertido == null) {
      return 'Informe um valor válido';
    }

     if (!RegExp(r'^\d+([,.]\d{1,2})?$').hasMatch(valor)) {
      return 'O valor deve ter no máximo duas casas decimais';
    }

    if (valorConvertido < 1 || valorConvertido > 99999.99) {
      return 'O valor deve estar entre R\$ 1,00 e R\$ 99999,99';
    } 

    return null;
  }

  String? validarQuantidade (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo quantidade é obrigatório';
    }

    int? quantidadeConvertida = int.tryParse(valor);
    if (quantidadeConvertida == null) {
      return 'Informe uma quantidade válida';
    }

    if (quantidadeConvertida < 1 || quantidadeConvertida > 100) {
      return 'A quantidade deve estar entre 1 e 100';
    }

    return null;
  }

  String? validarDesconto (String? valor) {
    if(valor == null || valor.isEmpty) {
      return 'O campo de percentual de desconto é obrigatório';
    }

    int? descontoConvertido = int.tryParse(valor);
    if (descontoConvertido == null) {
      return 'Informe um percentual de desconto válido';
    }

    if (descontoConvertido < 0 || descontoConvertido > 100) {
     return 'O percentual de desconto deve estar entre 0 e 100';
    } 

    return null;
  }

  void salvar() {
    FormState? formularioEstado = formularioChave.currentState;

    if (formularioEstado == null || !formularioEstado.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pedido salvo com sucesso'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Pedido'),
      ),
      body: Form (
        key: formularioChave,
        child: Padding (
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField (
                controller: nomeControlador,
                decoration: InputDecoration (
                  labelText: 'Nome do Cliente',
                  hintText: 'Ex: João da Silva',
                  border: OutlineInputBorder(),
                ),
                validator: validarNome,
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: valorControlador,
                decoration: InputDecoration(
                  labelText: 'Valor do Pedido',
                  hintText: 'Ex: 1200,50',
                  border: OutlineInputBorder(),
                ),
                validator: validarValor,
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: quantidadeControlador,
                decoration: InputDecoration(
                  labelText: 'Quantidade de Itens',
                  hintText: 'Ex: 5',
                  border: OutlineInputBorder(),
                ),
                validator: validarQuantidade,
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: descontoControlador,
                decoration: InputDecoration(
                  labelText: 'Percentual de Desconto',
                  hintText: 'Ex: 10',
                  border: OutlineInputBorder(),
                ),
                validator: validarDesconto,
              ),

              SizedBox(height: 10,),

              ElevatedButton(
                onPressed: salvar, 
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      )
    );
  }
}

/*Exercício 2 — Cadastro de Pedido
Crie uma tela para registrar um pedido contendo:

Nome do cliente;
Valor do pedido;
Quantidade de itens;
Percentual de desconto.
Nome do cliente
Campo obrigatório;
Deve possuir entre 3 e 60 caracteres.
Valor do pedido
Campo obrigatório;
Deve aceitar valores decimais utilizando ponto ou vírgula;
Deve possuir no máximo duas casas decimais;
Deve estar entre R$ 1,00 e R$ 99.999,99.
Quantidade de itens
Campo obrigatório;
Deve ser um número inteiro;
Deve estar entre 1 e 100.
Percentual de desconto
Campo obrigatório;
Deve ser um número inteiro;
Deve estar entre 0 e 100.
Caso todos os dados estejam corretos, exiba um SnackBar informando que o pedido foi salvo com sucesso.*/