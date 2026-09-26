import 'package:flutter/material.dart';

// Exercício 4 — Cadastro de Livro
// Crie uma tela para cadastro de livros contendo os seguintes campos:

// Título;
// Autor;
// Número de páginas;
// Código do livro.
// Faça as seguintes validações:

// Título
// Campo obrigatório;
// Deve possuir entre 2 e 100 caracteres.
// Autor
// Campo obrigatório;
// Deve possuir entre 3 e 100 caracteres.
// Número de páginas
// Campo obrigatório;
// Deve aceitar apenas números inteiros;
// Deve estar entre 1 e 10.000.
// Código do livro
// O código deve seguir o seguinte formato:

// ABC-1234

// Onde:

// As três primeiras posições devem ser letras;
// Em seguida deve existir um hífen;
// As quatro últimas posições devem ser números.
// Exemplos válidos:

// ABC-1234
// XYZ-0001

// Exemplos inválidos:

// AB-1234
// ABC1234
// 123-ABCD

// Caso todos os dados estejam corretos, exiba:

// Livro salvo com sucesso

class Exercicio4App extends StatelessWidget {
  const Exercicio4App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 4 - Cadastro de livro',
      home: Exercicio4Page(),
    );
  }
}

class Exercicio4Page extends StatefulWidget {
  const Exercicio4Page({super.key});
  @override
  State<StatefulWidget> createState() {
    return Exercicio4State();
  }
}

class Exercicio4State extends State<Exercicio4Page> {
  
  TextEditingController tituloControlador = TextEditingController();
  TextEditingController autorControlador = TextEditingController();
  TextEditingController paginasControlador = TextEditingController();
  TextEditingController codigoControlador = TextEditingController();

  String mensagem = '';

  void salvar() {
    String titulo = tituloControlador.text.trim();
    String autor = autorControlador.text.trim();
    String paginas = paginasControlador.text.trim();
    String codigo = codigoControlador.text.trim();

    if (titulo.isEmpty) {
      setState(() {
        mensagem = 'O campo título é obrigatório';
      });
      return;
    }

    if (titulo.length < 2 || titulo.length > 100) {
      setState(() {
        mensagem = 'O título deve ter entre 2 e 100 caracteres';
      });
      return;
    }

    if (autor.isEmpty) {
      setState(() {
        mensagem = 'O campo autor é obrigatório';
      });
      return;
    }

    if (autor.length < 3 || autor.length > 100) {
      setState(() {
        mensagem = 'O autor deve ter entre 3 e 100 caracteres';
      });
      return;
    }

    if (paginas.isEmpty) {
      setState(() {
        mensagem = 'O campo número de páginas é obrigatório';
      });
      return;
    }

    int? paginasConvertidas = int.tryParse(paginas);
    if (paginasConvertidas == null) {
      setState(() {
        mensagem = 'Informe um número de páginas válido';
      });
      return;
    }

    if (paginasConvertidas < 1 || paginasConvertidas > 10000) {
      setState(() {
        mensagem = 'O número de páginas deve estar entre 1 e 10.000';
      });
      return;
    }

    if (codigo.isEmpty) {
      setState(() {
        mensagem = 'O campo código do livro é obrigatório';
      });
      return;
    }

    if (!RegExp(r'^[A-Za-z]{3}-\d{4}$').hasMatch(codigo)) {
      setState(() {
        mensagem = 'O código do livro deve seguir o formato ABC-1234';
      });
      return;
    }

    setState(() {
      mensagem = 'Livro salvo com sucesso';
    });  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Livro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: tituloControlador,
              decoration: InputDecoration(
                labelText: 'Título do Livro',
                hintText: 'Ex: Dom Casmurro',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: autorControlador,
              decoration: InputDecoration(
                labelText: 'Autor do Livro',
                hintText: 'Ex: Machado de Assis',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: paginasControlador,
              decoration: InputDecoration(
                labelText: 'Número de Páginas',
                hintText: 'Ex: 300',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: codigoControlador,
              decoration: InputDecoration(
                labelText: 'Código do Livro',
                hintText: 'Ex: ABC-1234',
                border: OutlineInputBorder(),
              ),
            ),
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