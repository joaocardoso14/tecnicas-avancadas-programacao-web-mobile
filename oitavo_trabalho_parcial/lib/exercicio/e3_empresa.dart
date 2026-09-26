import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:intl/intl.dart';
import 'package:all_br_forms/all_br_forms.dart';
import 'package:all_br_validations/all_br_validations.dart';

class AppEmpresa extends StatelessWidget {
  const AppEmpresa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Empresas',
      home: EmpresaPage(),
    );
  }
}

class EmpresaPage extends StatefulWidget {
  const EmpresaPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return EmpresaState();
  }
}

class EmpresaState extends State<EmpresaPage> {
  TextEditingController razaoSocialControlador = TextEditingController();
  TextEditingController cnpjControlador = TextEditingController();
  TextEditingController emailControlador = TextEditingController();
  TextEditingController telefoneControlador = TextEditingController();
  TextEditingController capitalSocialControlador = TextEditingController();

  GlobalKey<FormState> formularioChave = GlobalKey<FormState>();

  @override
  void dispose() {
    razaoSocialControlador.dispose();
    cnpjControlador.dispose();
    emailControlador.dispose();
    telefoneControlador.dispose();
    capitalSocialControlador.dispose();

    super.dispose();
  }

  

  void salvar() {
    FormState? formularioEstado = formularioChave.currentState;

    if (formularioEstado == null || !formularioEstado.validate()) {
      return;
    }

    String valor = capitalSocialControlador.text
        .replaceAll('R\$', '')
        .replaceAll('.', '')
        .replaceAll(',', '.')
        .trim();

    double capitalSocial = double.parse(valor);

    String capitalFormatado = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
    ).format(capitalSocial);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Empresa cadastrada com sucesso! Capital social: $capitalFormatado',
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
                controller: razaoSocialControlador,
                decoration: const InputDecoration(
                  labelText: 'Razão Social',
                  hintText: 'Ex: Empresa João da Silva LTDA',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required(
                    'A razão social é obrigatória',
                  ),
                  Validatorless.between(
                    3, 100, 'A razão social deve ter entre 3 e 100 caracteres',
                  ),
                ]),
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: cnpjControlador,
                keyboardType: TextInputType.number,
                inputFormatters: const [
                  CnpjMask(),
                ],
                decoration: const InputDecoration(
                  labelText: 'CNPJ',
                  hintText: 'Ex: 12.345.678/0001-95',
                  border: OutlineInputBorder(),
                ),
                validator: BrZod()
                    .required()
                    .cnpj()
                    .build,
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: emailControlador,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  hintText: 'Ex: empresa@gmail.com',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required(
                    'O e-mail é obrigatório',
                  ),
                  Validatorless.email(
                    'Informe um e-mail válido',
                  ),
                ]),
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: telefoneControlador,
                keyboardType: TextInputType.phone,
                inputFormatters: const [
                  PhoneMask(),
                ],
                decoration: const InputDecoration(
                  labelText: 'Telefone',
                  hintText: 'Ex: (14) 4002-8922',
                  border: OutlineInputBorder(),
                ),
                validator: BrZod()
                    .required()
                    .phone()
                    .build,
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: capitalSocialControlador,
                keyboardType: TextInputType.number,
                inputFormatters: const [
                  CurrencyMask(),
                ],
                decoration: const InputDecoration(
                  labelText: 'Capital Social',
                  hintText: 'Ex: R\$ 50.000,00',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required(
                    'O capital social é obrigatório',
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

                    double? capitalSocial = double.tryParse(valorNumerico);

                    if (capitalSocial == null) {
                      return 'Informe um valor válido';
                    }

                    if (capitalSocial < 1000 ||
                        capitalSocial > 100000000) {
                      return 'O capital social deve estar entre R\$ 1.000,00 e R\$ 100.000.000,00';
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
 * Exercício 3 — Cadastro de Empresa
Crie uma tela para cadastro de uma empresa contendo:

Razão social;
CNPJ;
E-mail;
Telefone;
Valor do capital social.
Razão social
Campo obrigatório;
Deve possuir entre 3 e 100 caracteres.
Utilize validatorless.

CNPJ
Campo obrigatório;
Deve ser um CNPJ válido.
Utilize all_br_forms.

E-mail
Campo obrigatório;
Deve possuir formato válido.
Utilize validatorless.

Telefone
Campo obrigatório;
Deve ser um telefone válido no padrão brasileiro.
Utilize all_br_forms.

Capital social
Campo obrigatório;
Deve possuir no máximo duas casas decimais;
Deve estar entre R$ 1.000,00 e R$ 100.000.000,00;
Deve ser apresentado utilizando formatação monetária brasileira.
Utilize intl para a formatação monetária.

Caso todos os dados estejam corretos, exiba:

Empresa cadastrada com sucesso

utilizando um SnackBar.
*/