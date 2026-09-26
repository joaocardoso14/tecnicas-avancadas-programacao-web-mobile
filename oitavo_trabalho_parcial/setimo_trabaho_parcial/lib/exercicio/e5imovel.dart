import 'package:flutter/material.dart';

class AppImovel extends StatelessWidget {
  const AppImovel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Imóvel',
      home: ImovelPage(),
    );
  }
}

class ImovelPage extends StatefulWidget {
  const ImovelPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return ImovelState();
  }
}

class ImovelState extends State<ImovelPage> {
  TextEditingController enderecoControlador = TextEditingController();
  TextEditingController numeroControlador = TextEditingController();
  TextEditingController areaControlador = TextEditingController();
  TextEditingController valorControlador = TextEditingController();

  GlobalKey<FormState> formularioChave = GlobalKey<FormState>(); 

  // String mensagem = '';

  String? validarEndereco (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo endereço é obrigatório';
    }

    if (valor.length < 5 || valor.length > 100) {
      return 'O endereço deve ter entre 5 e 100 caracteres';
    }

    return null;
  }

  String? validarNumero (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo número é obrigatório';
    }
    int? numeroConvertido = int.tryParse(valor);
    if (numeroConvertido == null) {
      return 'Informe um número válido';
    }
    
    if (numeroConvertido < 1 || numeroConvertido > 99999) {
      return 'O número deve estar entre 1 e 99.999';
    }

    return null;
  }

  String? validarArea (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo área é obrigatório';
    }

    double? areaConvertida = double.tryParse(valor.replaceAll(',', '.'));
    if (areaConvertida == null) {
      return 'Informe uma área válida';
    }

    if (areaConvertida < 10 || areaConvertida > 10000) {
      return 'A área deve estar entre 10 e 10000 metros quadrados';
    }

    return null;
  }

  String? validarValor (String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'O campo valor é obrigatório';
    }

    double? valorConvertido = double.tryParse(valor.replaceAll(',', '.'));
    if (valorConvertido == null) {
      return 'Informe um valor válido';
    }

    if (valorConvertido < 20000 || valorConvertido > 10000000) {
      return 'O valor deve estar entre R\$ 20.000,00 e R\$ 10.000.000,00';
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
        content: Text('Imóvel salvo com sucesso'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Imóvel'),
      ),
      body: Form (
        key: formularioChave,
        child: Padding (
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField (
                controller: enderecoControlador,
                decoration: InputDecoration (
                  labelText: 'Endereço',
                  hintText: 'Ex: Rua Exemplo, 123',
                  border: OutlineInputBorder(),
                ),
                validator: validarEndereco,
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: numeroControlador,
                decoration: InputDecoration(
                  labelText: 'Número',
                  hintText: 'Ex: 123',
                  border: OutlineInputBorder(),
                ),
                validator: validarNumero,
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: areaControlador,
                decoration: InputDecoration(
                  labelText: 'Área',
                  hintText: 'Ex: 120,50',
                  border: OutlineInputBorder(),
                ),
                validator: validarArea,
              ),

              SizedBox(height: 10,),

              TextFormField (
                controller: valorControlador,
                decoration: InputDecoration(
                  labelText: 'Valor do Imóvel',
                  hintText: 'Ex: 500000,00',
                  border: OutlineInputBorder(),
                ),
                validator: validarValor,
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
/*Exercício 5 — Cadastro de Imóvel
Crie uma tela para cadastrar um imóvel contendo:

Endereço;
Número;
Área;
Valor do imóvel.
Endereço
Campo obrigatório;
Deve possuir entre 5 e 100 caracteres.
Número
Campo obrigatório;
Deve ser um número inteiro;
Deve estar entre 1 e 99.999.
Área
Campo obrigatório;
Deve aceitar valores decimais utilizando ponto ou vírgula;
Deve possuir no máximo duas casas decimais;
Deve estar entre 10 e 10.000 m².
Valor do imóvel
Campo obrigatório;
Deve aceitar valores decimais utilizando ponto ou vírgula;
Deve possuir no máximo duas casas decimais;
Deve estar entre R$ 20.000,00 e R$ 10.000.000,00.
Caso todos os dados estejam corretos, exiba um SnackBar informando que o imóvel foi cadastrado com sucesso.

*/