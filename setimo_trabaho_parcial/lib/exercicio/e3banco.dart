import 'package:flutter/material.dart';

class AppBanco extends StatelessWidget {
  const AppBanco({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Conta Bancária',
      home: BancoPage(),
    );
  }
}

class BancoPage extends StatefulWidget {
  const BancoPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return BancoState();
  }
}

class BancoState extends State<BancoPage> {
  TextEditingController nomeControlador = TextEditingController();
  TextEditingController numeroBancoControlador = TextEditingController();
  TextEditingController agenciaControlador = TextEditingController();
  TextEditingController numeroContaControlador = TextEditingController();
  TextEditingController saldoControlador = TextEditingController();

  GlobalKey<FormState> formularioChave = GlobalKey<FormState>(); 

  String? validarNome (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo nome é obrigatório';
    }

    if (valor.length < 3 || valor.length > 80) {
      return 'O nome deve ter entre 3 e 80 caracteres';
    }

    return null;
  }

  String? validarNBanco (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo número do banco é obrigatório';
    }

    int? numeroBancoConvertido = int.tryParse(valor);
    if (numeroBancoConvertido == null) {
      return 'Informe um número de banco válido';
    }

    if (valor.length != 3) {
      return 'O número do banco deve possuir exatamente 3 dígitos';
    }

    return null;
  }

  String? validarAgencia (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo agência é obrigatório';
    }

    int? agenciaConvertida = int.tryParse(valor);
    if (agenciaConvertida == null) {
      return 'Informe uma agência válida';
    }

    if (valor.length < 4 || valor.length > 5) {
      return 'A agência deve possuir entre 4 e 5 dígitos';
    }

    return null;
  }

  String? validarNConta (String? valor) {
    if(valor == null || valor.isEmpty) {
      return 'O campo número da conta é obrigatório';
    }

    int? numeroContaConvertido = int.tryParse(valor);
    if (numeroContaConvertido == null) {
      return 'Informe um número de conta válido';
    }

    if (valor.length < 5 || valor.length > 10) {
      return 'O número da conta deve possuir entre 5 e 10 dígitos';
    } 

    return null;
  }

  String? validarSaldo (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo saldo é obrigatório';
    }

    double? saldoConvertido = double.tryParse(valor.replaceAll(',', '.'));
    if (saldoConvertido == null) {
      return 'Informe um saldo válido';
    }

     if (!RegExp(r'^\d+([,.]\d{1,2})?$').hasMatch(valor)) {
      return 'O saldo deve ter no máximo duas casas decimais';
    }

    if (saldoConvertido < 0 || saldoConvertido > 1000000) {
      return 'O saldo deve estar entre R\$ 0,00 e R\$ 1000000,00';
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
        content: Text('Conta salva com sucesso'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Conta Bancária'),
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
                controller: numeroBancoControlador,
                decoration: InputDecoration(
                  labelText: 'Número do Banco',
                  hintText: 'Ex: 123',
                  border: OutlineInputBorder(),
                ),
                validator: validarNBanco,
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: agenciaControlador,
                decoration: InputDecoration(
                  labelText: 'Agência',
                  hintText: 'Ex: 1234',
                  border: OutlineInputBorder(),
                ),
                validator: validarAgencia,
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: numeroContaControlador,
                decoration: InputDecoration(
                  labelText: 'Número da Conta',
                  hintText: 'Ex: 12345',
                  border: OutlineInputBorder(),
                ),
                validator: validarNConta,
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: saldoControlador,
                decoration: InputDecoration(
                  labelText: 'Saldo Inicial',
                  hintText: 'Ex: 1000,00',
                  border: OutlineInputBorder(),
                ),
                validator: validarSaldo,
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
/*Exercício 3 — Cadastro de Conta Bancária
Crie uma tela para cadastrar uma conta bancária contendo:

Nome do titular;
Número do banco;
Agência;
Número da conta;
Saldo inicial.
Nome do titular
Campo obrigatório;
Deve possuir entre 3 e 80 caracteres.
Número do banco
Campo obrigatório;
Deve ser um número inteiro;
Deve possuir exatamente 3 dígitos.
Agência
Campo obrigatório;
Deve ser um número inteiro;
Deve possuir entre 4 e 5 dígitos.
Número da conta
Campo obrigatório;
Deve ser um número inteiro;
Deve possuir entre 5 e 10 dígitos.
Saldo inicial
Campo obrigatório;
Deve aceitar valores decimais utilizando ponto ou vírgula;
Deve possuir no máximo duas casas decimais;
Não pode ser negativo;
Deve ser no máximo R$ 1.000.000,00.
Caso todos os dados estejam corretos, exiba um SnackBar informando que a conta foi cadastrada com sucesso.*/