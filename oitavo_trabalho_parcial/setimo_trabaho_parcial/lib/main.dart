import 'package:flutter/material.dart';
import 'package:setimo_trabaho_parcial/exercicio/e1funcionario.dart';
import 'package:setimo_trabaho_parcial/exercicio/e2pedido.dart';
import 'package:setimo_trabaho_parcial/exercicio/e3banco.dart';
import 'package:setimo_trabaho_parcial/exercicio/e4curso.dart';
import 'package:setimo_trabaho_parcial/exercicio/e5imovel.dart';


void main() {
  runApp(AppFuncionario());
  runApp(AppPedido());
  runApp(AppBanco());
  runApp(AppCurso());
  runApp(AppImovel());
}


/* Lista de Exercícios — Flutter: Form, TextFormField e Validator
Esta lista de exercícios é de realização individual.

Todos os exercícios devem ser desenvolvidos utilizando os conceitos apresentados em aula.

Após concluir os exercícios, o aluno deverá compactar todo o projeto Flutter em um arquivo .zip e realizar a entrega do arquivo compactado no local indicado pelo professor.

Todos os exercícios deverão estar presentes no mesmo projeto Flutter.

Orientações
Nesta atividade, os formulários deverão ser desenvolvidos utilizando os recursos apresentados em aula:

StatefulWidget;
TextEditingController;
dispose();
Form;
GlobalKey<FormState>;
TextFormField;
validator;
int.tryParse();
double.tryParse();
RegExp.
Todos os campos que possuírem regras de validação deverão utilizar a propriedade validator do TextFormField.

As validações não devem ser realizadas manualmente no método salvar().

O método responsável pelo botão Salvar deverá utilizar o Form para executar as validações.

Caso alguma regra não seja atendida, uma mensagem adequada deverá ser apresentada no respectivo campo.

Caso todas as validações sejam atendidas, deverá ser exibida uma mensagem de sucesso utilizando um SnackBar.

Pesquisa
Pesquise na documentação do Flutter como utilizar o ScaffoldMessenger para exibir um SnackBar.

A mensagem de sucesso deve ser exibida somente depois que o formulário for considerado válido.


Em todos os exercícios:

Utilize um StatefulWidget.
Utilize TextEditingController para os campos.
Utilize dispose() para liberar os controllers.
Utilize Form.
Utilize um GlobalKey<FormState>.
Utilize TextFormField.
Cada campo deverá possuir seu próprio validator.
Utilize int.tryParse() para validações que envolvam números inteiros.
Utilize double.tryParse() para validações que envolvam valores decimais.
Utilize RegExp quando necessário para validar formatos específicos.
O método salvar() deverá utilizar validate() para verificar o formulário.
Não realize as validações dos campos diretamente dentro do método salvar().
Caso o formulário seja válido, apresente uma mensagem de sucesso utilizando SnackBar.
Pesquise como utilizar ScaffoldMessenger para apresentar o SnackBar.
A mensagem de sucesso somente deverá aparecer quando todas as validações forem aprovadas.
*/