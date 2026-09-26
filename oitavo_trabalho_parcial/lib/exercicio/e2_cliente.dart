import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:intl/intl.dart';
import 'package:all_br_forms/all_br_forms.dart';
import 'package:all_br_validations/all_br_validations.dart';

class AppCliente extends StatelessWidget {
  const AppCliente({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Clientes',
      home: ClientePage(),
    );
  }
}

class ClientePage extends StatefulWidget {
  const ClientePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return ClienteState();
  }
}

class ClienteState extends State<ClientePage> {
TextEditingController nomeControlador = TextEditingController();
  TextEditingController cpfControlador = TextEditingController();
  TextEditingController emailControlador = TextEditingController();
  TextEditingController telefoneControlador = TextEditingController();
  TextEditingController dataNascimentoControlador = TextEditingController();

  GlobalKey<FormState> formularioChave = GlobalKey<FormState>(); 

  @override
  void dispose() {
    nomeControlador.dispose();
    cpfControlador.dispose();
    emailControlador.dispose();
    telefoneControlador.dispose();
    dataNascimentoControlador.dispose();

    super.dispose();
  }

  
 
  String? validarIdadeMinima(String? valor) {
    if (valor == null || valor.isEmpty) {
      return null;
    }

    try {
      DateTime dataNascimento = DateFormat(
        'dd/MM/yyyy',
      ).parseStrict(valor);

      DateTime hoje = DateTime.now();

      int idade = hoje.year - dataNascimento.year;

      if (hoje.month < dataNascimento.month ||
          (hoje.month == dataNascimento.month &&
              hoje.day < dataNascimento.day)) {
        idade--;
      }

      if (idade < 18) {
        return 'O cliente deve possuir pelo menos 18 anos';
      }

      return null;
    } catch (e) {
      return 'Informe uma data válida';
    }
  }

  void salvar() {
    FormState? formularioEstado = formularioChave.currentState;

    if (formularioEstado == null || !formularioEstado.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Cliente cadastrado com sucesso',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Cliente'),
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
                validator: Validatorless.multiple([
                  Validatorless.required('O nome é obrigatório'),
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
                controller: emailControlador,
                decoration: InputDecoration(
                  labelText: 'E-mail do Cliente',
                  hintText: 'Ex: joaosilva@gmail.com',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('O e-mail é obrigatória'),
                  Validatorless.email('Informe um e-mail válido'),
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
                  labelText: 'Telefone do Cliente',
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
                controller: dataNascimentoControlador,
                keyboardType: TextInputType.datetime,
                inputFormatters: const [
                  DateMask(),
                ],
                decoration: const InputDecoration(
                  labelText: 'Data de Nascimento do Cliente',
                  hintText: 'Ex: 26/09/1999',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required(
                    'A data de nascimento é obrigatória',
                  ),
                  Validatorless.date(
                    'Informe uma data válida no formato dd/MM/yyyy',
                  ),
                  validarIdadeMinima,
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
Exercício 2 — Cadastro de Cliente
Crie uma tela para cadastro de cliente contendo:

Nome;
CPF;
E-mail;
Telefone;
Data de nascimento.
Nome
Campo obrigatório;
Deve possuir entre 3 e 80 caracteres.
Utilize validatorless.

CPF
Campo obrigatório;
Deve ser um CPF válido.
Utilize all_br_forms.

E-mail
Campo obrigatório;
Deve possuir formato válido de e-mail.
Utilize validatorless.

Telefone
Campo obrigatório;
Deve ser um telefone válido no padrão brasileiro.
Utilize all_br_forms.

Data de nascimento
Campo obrigatório;
Deve ser informada no formato dd/MM/yyyy;
A data deve ser válida;
A pessoa deve possuir pelo menos 18 anos.
Utilize intl para trabalhar com a data.

Caso todos os dados estejam corretos, exiba:

Cliente cadastrado com sucesso

utilizando um SnackBar.
*/