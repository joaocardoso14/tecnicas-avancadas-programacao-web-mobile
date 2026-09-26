import 'package:flutter/material.dart';

class ProdutoPage extends StatefulWidget {
  const ProdutoPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ProdutoState();
  }
}

class ProdutoState extends State<ProdutoPage> {
  TextEditingController nomeControlador = TextEditingController();
  TextEditingController precoControlador = TextEditingController();
  TextEditingController quantidadeControlador = TextEditingController();

  String mensagem = '';

  void salvar() {
    String nome = nomeControlador.text.trim();
    String preco = precoControlador.text.trim();
    String quantidade = quantidadeControlador.text.trim();

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

    if (precoConvertido < 0.10 || precoConvertido > 1000) {
      setState(() {
        mensagem = 'O preço deve estar entre R\$ 0,10 e R\$ 1000,00';
      });
      return;
    } 

    if(quantidade.isEmpty) {
      setState(() {
        mensagem = 'O campo quantidade é obrigatório';
      });
      return;
    }

    int? quantidadeConvertida = int.tryParse(quantidade);
    if (quantidadeConvertida == null) {
      setState(() {
        mensagem = 'Informe uma quantidade válida';
      });
      return;
    }

    if (quantidadeConvertida < 1 || quantidadeConvertida > 100) {
      setState(() {
        mensagem = 'A quantidade deve estar entre 1 e 100';
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
        title: Text('Cadastro de Produto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: nomeControlador,
              decoration: InputDecoration(
                labelText: 'Nome do Produto',
                hintText: 'Ex: Coca Cola 2 Litros',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: precoControlador,
              decoration: InputDecoration(
                labelText: 'Preço do Produto',
                hintText: 'Ex: 12,50',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: quantidadeControlador,
              decoration: InputDecoration(
                labelText: 'Quantidade do Produto',
                hintText: 'Ex: 10',
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
