import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:intl/intl.dart';
import 'package:all_br_forms/all_br_forms.dart';
import 'package:all_br_validations/all_br_validations.dart';

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
  TextEditingController cpfControlador = TextEditingController();
  TextEditingController salarioControlador = TextEditingController();
  TextEditingController idadeControlador = TextEditingController();
  TextEditingController dependentesControlador = TextEditingController();

  GlobalKey<FormState> formularioChave = GlobalKey<FormState>(); 

  @override
  void dispose() {
    nomeControlador.dispose();
    cpfControlador.dispose();
    salarioControlador.dispose();
    idadeControlador.dispose();
    dependentesControlador.dispose();

    super.dispose();
  }

  

  void salvar() {
    FormState? formularioEstado = formularioChave.currentState;

    if (formularioEstado == null || !formularioEstado.validate()) {
      return;
    }

    String valor = salarioControlador.text
        .replaceAll('R\$', '')
        .replaceAll('.', '')
        .replaceAll(',', '.')
        .trim();

    double salario = double.parse(valor);

    String salarioFormatado = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
    ).format(salario);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Funcionário salvo com sucesso! Salário: $salarioFormatado',
        ),
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
                validator: Validatorless.multiple([
                  Validatorless.required('O nome é obrigatório'),
                  Validatorless.between(
                    3, 60, 'O nome deve ter entre 3 e 60 caracteres',
                  ),
                ]),
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: cpfControlador,
                keyboardType: TextInputType.number,
                inputFormatters: const [
                  CpfMask(),
                ],
                decoration: const InputDecoration(
                  labelText: 'CPF',
                  hintText: 'Ex: 529.982.247-25',
                  border: OutlineInputBorder(),
                ),
                validator: BrZod()
                    .required()
                    .cpf()
                    .build,
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: idadeControlador,
                decoration: InputDecoration(
                  labelText: 'Idade do Funcionario',
                  hintText: 'Ex: 30',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('A idade é obrigatória'),
                  Validatorless.number('Informe uma idade válida'),
                  Validatorless.numbersBetweenInterval(
                    18, 100, 'A idade deve estar entre 18 e 100',
                  ),
                ]),
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: salarioControlador,
                keyboardType: TextInputType.number,
                inputFormatters: const [
                  CurrencyMask(),
                ],
                decoration: const InputDecoration(
                  labelText: 'Salário do Funcionário',
                  hintText: 'Ex: R\$ 1.200,50',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('O salário é obrigatório'),
                  Validatorless.regex(
                    RegExp(r'^R\$ \d{1,3}(\.\d{3})*,\d{2}$'),
                    'Informe um salário válido',
                  ),
                  (valor) {
                    if (valor == null || valor.isEmpty) {
                      return null;
                    }

                    String valorNumerico = valor
                        .replaceAll('R\$', '')
                        .replaceAll('.', '')
                        .replaceAll(',', '.')
                        .trim();

                    double salario = double.parse(valorNumerico);

                    if (salario < 1000 || salario > 50000) {
                      return 'O salário deve estar entre R\$ 1.000,00 e R\$ 50.000,00';
                    }

                    return null;
                  },
                ]),
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: dependentesControlador,
                decoration: InputDecoration(
                  labelText: 'Quantidade de Dependentes',
                  hintText: 'Ex: 2',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('A quantidade é obrigatória'),
                  Validatorless.number('Informe uma quantidade válida'),
                  Validatorless.numbersBetweenInterval(
                    0,
                    10,
                    'A quantidade deve estar entre 0 e 10',
                  ),
                ]),
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


/*
Exercício 1 — Cadastro de Funcionário
Refaça o cadastro de funcionário utilizando as bibliotecas deste trabalho.

O formulário deverá possuir:

Nome;
CPF;
Idade;
Salário;
Quantidade de dependentes.
Nome
Campo obrigatório;
Deve possuir entre 3 e 60 caracteres.
Utilize validatorless para realizar as validações.

CPF
Campo obrigatório;
Deve ser um CPF válido.
Utilize all_br_forms para realizar a validação do CPF.

Idade
Campo obrigatório;
Deve ser um número inteiro;
Deve estar entre 18 e 100.
Utilize os recursos disponíveis nas bibliotecas sempre que aplicável.

Salário
Campo obrigatório;
Deve aceitar valores decimais;
Deve possuir no máximo duas casas decimais;
Deve estar entre R$ 1.000,00 e R$ 50.000,00;
O valor deve ser apresentado utilizando formatação de moeda brasileira.
Utilize intl para a formatação monetária.

Quantidade de dependentes
Campo obrigatório;
Deve ser um número inteiro;
Deve estar entre 0 e 10.
Caso todos os dados estejam corretos, exiba uma mensagem de sucesso utilizando SnackBar.
*/