import 'package:flutter/material.dart';

class AppCurso extends StatelessWidget {
  const AppCurso({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Curso',
      home: CursoPage(),
    );
  }
}

class CursoPage extends StatefulWidget {
  const CursoPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return CursoState();
  }
}

class CursoState extends State<CursoPage> {
  TextEditingController nomeControlador = TextEditingController();
  TextEditingController codigoControlador = TextEditingController();
  TextEditingController horasControlador = TextEditingController();
  TextEditingController vagasControlador = TextEditingController();

  GlobalKey<FormState> formularioChave = GlobalKey<FormState>(); 

  // String mensagem = '';

  String? validarNome (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo nome é obrigatório';
    }

    if (valor.length < 5 || valor.length > 100) {
      return 'O nome deve ter entre 5 e 100 caracteres';
    }

    return null;
  }

  String? validarCodigo (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo código é obrigatório';
    }

    if (!RegExp(r'^[A-Z]{3}-\d{4}$').hasMatch(valor)) {
      return 'O código deve seguir o formato CUR-1234';
    }

    return null;
  }

  String? validarHoras (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo carga horária é obrigatório';
    }

    int? horasConvertidas = int.tryParse(valor);
    if (horasConvertidas == null) {
      return 'Informe uma carga horária válida';
    }

    if (horasConvertidas < 20 || horasConvertidas > 2000) {
      return 'A carga horária deve estar entre 20 e 2000';
    }

    return null;
  }

  String? validarVagas (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo número de vagas é obrigatório';
    }

    int? vagasConvertidas = int.tryParse(valor);
    if (vagasConvertidas == null) {
      return 'Informe um número de vagas válido';
    }

    if (vagasConvertidas < 1 || vagasConvertidas > 500) {
      return 'O número de vagas deve estar entre 1 e 500';
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
        content: Text('Curso salvo com sucesso'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Curso'),
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
                  labelText: 'Nome do Curso',
                  hintText: 'Ex: Flutter para Iniciantes',
                  border: OutlineInputBorder(),
                ),
                validator: validarNome,
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: codigoControlador,
                decoration: InputDecoration(
                  labelText: 'Código do Curso',
                  hintText: 'Ex: CUR-0001',
                  border: OutlineInputBorder(),
                ),
                validator: validarCodigo,
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: horasControlador,
                decoration: InputDecoration(
                  labelText: 'Carga Horária',
                  hintText: 'Ex: 100',
                  border: OutlineInputBorder(),
                ),
                validator: validarHoras,
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: vagasControlador,
                decoration: InputDecoration(
                  labelText: 'Número de Vagas',
                  hintText: 'Ex: 2',
                  border: OutlineInputBorder(),
                ),
                validator: validarVagas,
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
/*Exercício 4 — Cadastro de Curso
Crie uma tela para cadastrar um curso contendo:

Nome do curso;
Código do curso;
Carga horária;
Número de vagas.
Nome do curso
Campo obrigatório;
Deve possuir entre 5 e 100 caracteres.
Código do curso
O código deverá seguir o formato:

CUR-1234

Regras:

As três primeiras posições devem ser letras;
A quarta posição deve ser um hífen;
As quatro últimas posições devem ser números.
Exemplos válidos:

CUR-0001
WEB-1234
ADS-2026
Exemplos inválidos:

CU-1234
CUR1234
123-ABCD
CUR-123
Utilize uma expressão regular (RegExp) para validar o formato do código.

Carga horária
Campo obrigatório;
Deve ser um número inteiro;
Deve estar entre 20 e 2.000 horas.
Número de vagas
Campo obrigatório;
Deve ser um número inteiro;
Deve estar entre 1 e 500.
Caso todos os dados estejam corretos, exiba um SnackBar informando que o curso foi cadastrado com sucesso.*/