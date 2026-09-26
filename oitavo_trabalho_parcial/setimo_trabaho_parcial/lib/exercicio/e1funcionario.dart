import 'package:flutter/material.dart';

class AppFuncionario extends StatelessWidget {
  const AppFuncionario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Funcionário',
      home: FuncionarioPage(),
    );
  }
}

class FuncionarioPage extends StatefulWidget {
  const FuncionarioPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return FuncionarioState();
  }
}

class FuncionarioState extends State<FuncionarioPage> {
  TextEditingController nomeControlador = TextEditingController();
  TextEditingController salarioControlador = TextEditingController();
  TextEditingController idadeControlador = TextEditingController();
  TextEditingController dependentesControlador = TextEditingController();

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

  String? validarIdade (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo idade é obrigatório';
    }

    int? idadeConvertida = int.tryParse(valor);
    if (idadeConvertida == null) {
      return 'Informe uma idade válida';
    }

    if (idadeConvertida < 18 || idadeConvertida > 100) {
      return 'A idade deve estar entre 18 e 100';
    }

    return null;
  }

  String? validarSalario (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo preço é obrigatório';
    }

    double? salarioConvertido = double.tryParse(valor.replaceAll(',', '.'));
    if (salarioConvertido == null) {
      return 'Informe um salário válido';
    }

     if (!RegExp(r'^\d+([,.]\d{1,2})?$').hasMatch(valor)) {
      return 'O salário deve ter no máximo duas casas decimais';
    }

    if (salarioConvertido < 1000 || salarioConvertido > 50000) {
      return 'O salário deve estar entre R\$ 1000,00 e R\$ 50000,00';
    } 

    return null;
  }

  String? validarDependentes (String? valor) {
    if(valor == null || valor.isEmpty) {
      return 'O campo quantidade é obrigatório';
    }

    int? quantidadeConvertida = int.tryParse(valor);
    if (quantidadeConvertida == null) {
      return 'Informe uma quantidade válida';
    }

    if (quantidadeConvertida < 0 || quantidadeConvertida > 10) {
     return 'A quantidade deve estar entre 0 e 10';
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
        content: Text('Funcionário salvo com sucesso'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Funcionario'),
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
                  labelText: 'Nome do Funcionario',
                  hintText: 'Ex: João da Silva',
                  border: OutlineInputBorder(),
                ),
                validator: validarNome,
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: idadeControlador,
                decoration: InputDecoration(
                  labelText: 'Idade do Funcionario',
                  hintText: 'Ex: 30',
                  border: OutlineInputBorder(),
                ),
                validator: validarIdade,
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: salarioControlador,
                decoration: InputDecoration(
                  labelText: 'Salário do Funcionario',
                  hintText: 'Ex: 1200,50',
                  border: OutlineInputBorder(),
                ),
                validator: validarSalario,
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: dependentesControlador,
                decoration: InputDecoration(
                  labelText: 'Quantidade de Dependentes',
                  hintText: 'Ex: 2',
                  border: OutlineInputBorder(),
                ),
                validator: validarDependentes,
              ),

              SizedBox(height: 10,),
              //Caso todos os dados estejam corretos, exiba um SnackBar informando que o funcionário foi salvo com sucesso.

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
/*Exercício 1 — Cadastro de Funcionário
Crie uma tela para cadastrar um funcionário contendo os seguintes campos:

Nome;
Idade;
Salário;
Quantidade de dependentes.
Nome
Campo obrigatório;
Deve possuir entre 3 e 60 caracteres.
Idade
Campo obrigatório;
Deve ser um número inteiro;
Deve estar entre 18 e 100.
Utilize int.tryParse() para realizar a conversão.

Salário
Campo obrigatório;
Deve aceitar valores decimais utilizando ponto ou vírgula;
Deve possuir no máximo duas casas decimais;
Deve estar entre R$ 1.000,00 e R$ 50.000,00.
Utilize double.tryParse() e uma expressão regular para validar o formato do valor.

Quantidade de dependentes
Campo obrigatório;
Deve ser um número inteiro;
Deve estar entre 0 e 10.
Caso todos os dados estejam corretos, exiba um SnackBar informando que o funcionário foi salvo com sucesso.*/