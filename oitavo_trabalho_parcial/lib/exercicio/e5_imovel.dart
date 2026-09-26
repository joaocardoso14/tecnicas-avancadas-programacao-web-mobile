import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:intl/intl.dart';
import 'package:all_br_forms/all_br_forms.dart';
import 'package:all_br_validations/all_br_validations.dart';

class AppImovel extends StatelessWidget {
  const AppImovel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Imóveis',
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
  TextEditingController proprietarioControlador = TextEditingController();
  TextEditingController cpfControlador = TextEditingController();
  TextEditingController cepControlador = TextEditingController();
  TextEditingController enderecoControlador = TextEditingController();
  TextEditingController numeroControlador = TextEditingController();
  TextEditingController areaControlador = TextEditingController();
  TextEditingController valorImovelControlador = TextEditingController();

  GlobalKey<FormState> formularioChave = GlobalKey<FormState>();

  @override
  void dispose() {
    proprietarioControlador.dispose();
    cpfControlador.dispose();
    cepControlador.dispose();
    enderecoControlador.dispose();
    numeroControlador.dispose();
    areaControlador.dispose();
    valorImovelControlador.dispose();

    super.dispose();
  }

  

  void salvar() {
    FormState? formularioEstado = formularioChave.currentState;

    if (formularioEstado == null || !formularioEstado.validate()) {
      return;
    }

    String valor = valorImovelControlador.text
        .replaceAll('R\$', '')
        .replaceAll('.', '')
        .replaceAll(',', '.')
        .trim();

    double valorImovel = double.parse(valor);

    String valorFormatado = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
    ).format(valorImovel);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Imóvel cadastrado com sucesso! Valor: $valorFormatado',
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
              TextFormField(
                controller: proprietarioControlador,
                decoration: const InputDecoration(
                  labelText: 'Nome do Proprietário',
                  hintText: 'Ex: João da Silva',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required(
                    'O nome do proprietário é obrigatório',
                  ),
                  Validatorless.between(
                    3, 80, 'O nome deve ter entre 3 e 80 caracteres',
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
                  labelText: 'CPF do Proprietário',
                  hintText: 'Ex: 529.982.247-25',
                  border: OutlineInputBorder(),
                ),
                validator: BrZod()
                    .required()
                    .cpf()
                    .build,
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: cepControlador,
                keyboardType: TextInputType.number,
                inputFormatters: const [
                  CepMask(),
                ],
                decoration: const InputDecoration(
                  labelText: 'CEP',
                  hintText: 'Ex: 19900-000',
                  border: OutlineInputBorder(),
                ),
                validator: BrZod()
                    .required()
                    .cep()
                    .build,
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: enderecoControlador,
                decoration: const InputDecoration(
                  labelText: 'Endereço',
                  hintText: 'Ex: Rua das Flores',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required(
                    'O endereço é obrigatório',
                  ),
                  Validatorless.between(
                    5, 100, 'O endereço deve ter entre 5 e 100 caracteres',
                  ),
                ]),
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: numeroControlador,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Número',
                  hintText: 'Ex: 123',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required(
                    'O número é obrigatório',
                  ),
                  Validatorless.number(
                    'Informe um número inteiro válido',
                  ),
                  Validatorless.numbersBetweenInterval(
                    1, 99999, 'O número deve estar entre 1 e 99.999',
                  ),
                ]),
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: areaControlador,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Área do Imóvel (m²)',
                  hintText: 'Ex: 150,50',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required(
                    'A área do imóvel é obrigatória',
                  ),
                  (valor) {
                    if (valor == null || valor.isEmpty) {
                      return null;
                    }

                    String valorNumerico = valor.replaceAll(',', '.');

                    double? area = double.tryParse(valorNumerico);

                    if (area == null) {
                      return 'Informe uma área válida';
                    }

                    if (area < 10 || area > 10000) {
                      return 'A área deve estar entre 10 e 10.000 m²';
                    }

                    if (valor.contains(',')) {
                      String casasDecimais = valor.split(',').last;

                      if (casasDecimais.length > 2) {
                        return 'A área deve possuir no máximo duas casas decimais';
                      }
                    }

                    return null;
                  },
                ]),
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: valorImovelControlador,
                keyboardType: TextInputType.number,
                inputFormatters: const [
                  CurrencyMask(),
                ],
                decoration: const InputDecoration(
                  labelText: 'Valor do Imóvel',
                  hintText: 'Ex: R\$ 350.000,00',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required(
                    'O valor do imóvel é obrigatório',
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

                    double? valorImovel = double.tryParse(valorNumerico);

                    if (valorImovel == null) {
                      return 'Informe um valor válido';
                    }

                    if (valorImovel < 20000 ||
                        valorImovel > 10000000) {
                      return 'O valor deve estar entre R\$ 20.000,00 e R\$ 10.000.000,00';
                    }

                    return null;
                  },
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


/**
 * Exercício 5 — Cadastro de Imóvel
Crie uma tela para cadastro de um imóvel contendo:

Nome do proprietário;
CPF do proprietário;
CEP;
Endereço;
Número;
Área do imóvel;
Valor do imóvel.
Nome do proprietário
Campo obrigatório;
Deve possuir entre 3 e 80 caracteres.
Utilize validatorless.

CPF do proprietário
Campo obrigatório;
Deve ser um CPF válido.
Utilize all_br_forms.

CEP
Campo obrigatório;
Deve possuir formato válido de CEP.
Utilize all_br_forms.

Endereço
Campo obrigatório;
Deve possuir entre 5 e 100 caracteres.
Utilize validatorless.

Número
Campo obrigatório;
Deve ser um número inteiro;
Deve estar entre 1 e 99.999.
Área do imóvel
Campo obrigatório;
Deve aceitar valores decimais;
Deve possuir no máximo duas casas decimais;
Deve estar entre 10 e 10.000 m².
Valor do imóvel
Campo obrigatório;
Deve possuir no máximo duas casas decimais;
Deve estar entre R$ 20.000,00 e R$ 10.000.000,00;
Deve ser apresentado utilizando formatação monetária brasileira.
Utilize intl.

Caso todos os dados estejam corretos, exiba:

Imóvel cadastrado com sucesso

utilizando um SnackBar.
*/