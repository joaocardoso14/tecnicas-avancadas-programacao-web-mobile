import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:intl/intl.dart';
import 'package:all_br_forms/all_br_forms.dart';
// import 'package:all_br_validations/all_br_validations.dart';

class AppCurso extends StatelessWidget {
  const AppCurso({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Cursos',
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
  TextEditingController nomeCursoControlador = TextEditingController();
  TextEditingController descricaoControlador = TextEditingController();
  TextEditingController emailResponsavelControlador = TextEditingController();
  TextEditingController dataInicioControlador = TextEditingController();
  TextEditingController vagasControlador = TextEditingController();
  TextEditingController mensalidadeControlador = TextEditingController();

  GlobalKey<FormState> formularioChave = GlobalKey<FormState>();

  @override
  void dispose() {
    nomeCursoControlador.dispose();
    descricaoControlador.dispose();
    emailResponsavelControlador.dispose();
    dataInicioControlador.dispose();
    vagasControlador.dispose();
    mensalidadeControlador.dispose();

    super.dispose();
  }

  
 
  String? validarDataInicio(String? valor) {
    if (valor == null || valor.isEmpty) {
      return null;
    }

    try {
      DateTime dataInicio = DateFormat(
        'dd/MM/yyyy',
      ).parseStrict(valor);

      DateTime hoje = DateTime.now();

      DateTime dataAtual = DateTime(
        hoje.year,
        hoje.month,
        hoje.day,
      );

      if (!dataInicio.isAfter(dataAtual)) {
        return 'A data de início deve ser posterior à data atual';
      }

      return null;
    } catch (e) {
      return 'Informe uma data válida no formato dd/MM/yyyy';
    }
  }

  void salvar() {
  FormState? formularioEstado = formularioChave.currentState;

  if (formularioEstado == null || !formularioEstado.validate()) {
    return;
  }

  String valor = mensalidadeControlador.text
      .replaceAll('R\$', '')
      .replaceAll('.', '')
      .replaceAll(',', '.')
      .trim();

  double mensalidade = double.parse(valor);

  String mensalidadeFormatada = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  ).format(mensalidade);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Curso cadastrado com sucesso! Mensalidade: $mensalidadeFormatada',
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
                controller: nomeCursoControlador,
                decoration: const InputDecoration(
                  labelText: 'Nome do Curso',
                  hintText: 'Ex: Desenvolvimento de Sistemas',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required(
                    'O nome do curso é obrigatório',
                  ),
                  Validatorless.between(
                    5, 100, 'O nome deve ter entre 5 e 100 caracteres',
                  ),
                ]),
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: descricaoControlador,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  hintText: 'Digite a descrição do curso',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required(
                    'A descrição é obrigatória',
                  ),
                  Validatorless.between(
                    10, 500, 'A descrição deve ter entre 10 e 500 caracteres',
                  ),
                ]),
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: emailResponsavelControlador,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail do Responsável',
                  hintText: 'Ex: responsavel@gmail.com',
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
                controller: dataInicioControlador,
                keyboardType: TextInputType.datetime,
                inputFormatters: const [
                  DateMask(),
                ],
                decoration: const InputDecoration(
                  labelText: 'Data de Início',
                  hintText: 'Ex: 30/09/2026',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required(
                    'A data de início é obrigatória',
                  ),
                  validarDataInicio,
                ]),
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: vagasControlador,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Número de Vagas',
                  hintText: 'Ex: 40',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required(
                    'O número de vagas é obrigatório',
                  ),
                  Validatorless.number(
                    'Informe um número válido',
                  ),
                  Validatorless.numbersBetweenInterval(
                    1, 500, 'O número de vagas deve estar entre 1 e 500',
                  ),
                ]),
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: vagasControlador,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Número de Vagas',
                  hintText: 'Ex: 40',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required(
                    'O número de vagas é obrigatório',
                  ),
                  Validatorless.number(
                    'Informe um número válido',
                  ),
                  Validatorless.numbersBetweenInterval(
                    1,
                    500,
                    'O número de vagas deve estar entre 1 e 500',
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


/**
 * Exercício 4 — Cadastro de Curso
Crie uma tela para cadastro de um curso contendo:

Nome do curso;
Descrição;
E-mail do responsável;
Data de início;
Número de vagas;
Mensalidade.
Nome do curso
Campo obrigatório;
Deve possuir entre 5 e 100 caracteres.
Utilize validatorless.

Descrição
Campo obrigatório;
Deve possuir entre 10 e 500 caracteres.
Utilize validatorless.

E-mail do responsável
Campo obrigatório;
Deve possuir formato válido de e-mail.
Utilize validatorless.

Data de início
Campo obrigatório;
Deve utilizar o formato dd/MM/yyyy;
Deve representar uma data válida;
A data deve ser posterior à data atual.
Utilize intl para trabalhar com a data.

Número de vagas
Campo obrigatório;
Deve ser um número inteiro;
Deve estar entre 1 e 500.
Mensalidade
Campo obrigatório;
Deve possuir no máximo duas casas decimais;
Deve estar entre R$ 50,00 e R$ 10.000,00;
Deve ser apresentada utilizando formatação monetária brasileira.
Utilize intl.

Caso todos os dados estejam corretos, exiba:

Curso cadastrado com sucesso

utilizando um SnackBar.
*/