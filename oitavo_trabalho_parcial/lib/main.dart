import 'package:flutter/material.dart';

import 'package:oitavo_trabalho_parcial/exercicio/e1_funcionario.dart';
import 'package:oitavo_trabalho_parcial/exercicio/e2_cliente.dart';
import 'package:oitavo_trabalho_parcial/exercicio/e3_empresa.dart';
import 'package:oitavo_trabalho_parcial/exercicio/e4_curso.dart';
import 'package:oitavo_trabalho_parcial/exercicio/e5_imovel.dart';


void main() {
  runApp(AppFuncionario());
  runApp(AppCliente());
  runApp(AppEmpresa());
  runApp(AppCurso());
  runApp(AppImovel());
}

/*
Trabalho — Flutter: Validatorless, Intl e All Br Forms
Este trabalho é de realização individual.

O objetivo deste trabalho é refazer a lista de exercícios de formulários desenvolvida anteriormente, utilizando bibliotecas para reduzir a quantidade de validações e formatações implementadas manualmente.

Todos os exercícios deverão estar presentes no mesmo projeto Flutter.

Após concluir os exercícios, o aluno deverá compactar todo o projeto Flutter em um arquivo .zip e realizar a entrega do arquivo compactado no local indicado pelo professor.

Objetivos
Neste trabalho, deverão ser utilizadas as seguintes bibliotecas:

validatorless;
intl;
all_br_forms.
O objetivo é praticar:

validação de formulários utilizando bibliotecas;
composição de validadores;
validação de dados brasileiros;
formatação de valores;
formatação de datas;
utilização de Form;
utilização de TextFormField;
utilização de GlobalKey<FormState>.
Dependências
Adicione ao projeto as dependências necessárias para utilizar:

validatorless;
intl;
all_br_forms.
Consulte a documentação das bibliotecas para verificar a versão adequada e a forma correta de utilização.

Não copie exemplos completos da documentação. Utilize a documentação como referência para compreender e aplicar os recursos no seu projeto.

Orientações gerais
Os exercícios deste trabalho são baseados na lista anterior de formulários.

A estrutura geral deverá continuar utilizando:

StatefulWidget;
TextEditingController, quando necessário;
dispose();
Form;
GlobalKey<FormState>;
TextFormField.
Porém, as validações e formatações deverão ser adaptadas para utilizar as bibliotecas deste trabalho.

Validatorless
Sempre que existir um validador equivalente na biblioteca validatorless, utilize-o em vez de criar manualmente a mesma validação com if, RegExp, int.tryParse() ou double.tryParse().

Quando necessário, combine mais de uma validação.

Por exemplo, um campo pode precisar ser:

obrigatório;
ter tamanho mínimo;
ter tamanho máximo.
Nesse caso, pesquise na documentação como combinar os validadores.

All Br Forms
Utilize all_br_forms para as validações de documentos e dados brasileiros solicitados nos exercícios.

Intl
Utilize intl para as formatações solicitadas nos exercícios, especialmente:

valores monetários;
datas.
Importante
As bibliotecas devem ser utilizadas de forma efetiva.

Não implemente manualmente uma validação que já possa ser realizada adequadamente por uma das bibliotecas solicitadas.

Entretanto, regras específicas dos exercícios que não forem atendidas diretamente pelas bibliotecas poderão continuar utilizando uma validação própria.


Requisitos gerais
Em todos os exercícios:

Utilize StatefulWidget.
Utilize Form.
Utilize GlobalKey<FormState>.
Utilize TextFormField.
Utilize TextEditingController quando necessário.
Libere os controllers utilizando dispose().
Utilize validatorless sempre que houver um validador compatível.
Utilize all_br_forms para as validações de dados brasileiros solicitadas.
Utilize intl para as formatações e manipulações de datas solicitadas.
Evite implementar manualmente uma validação que possa ser realizada pelas bibliotecas.
Utilize validator nos TextFormField.
O botão de salvar deverá validar o formulário antes de apresentar a mensagem de sucesso.
Utilize ScaffoldMessenger e SnackBar para as mensagens de sucesso.
As mensagens de erro devem aparecer nos respectivos campos.
O formulário somente poderá apresentar a mensagem de sucesso quando todas as validações forem aprovadas.
Pesquisa e documentação
Durante o desenvolvimento, consulte a documentação das bibliotecas utilizadas.

Você deverá ser capaz de identificar:

qual recurso do validatorless foi utilizado em cada validação;
qual recurso do all_br_forms foi utilizado para cada dado brasileiro;
qual recurso do intl foi utilizado para cada formatação ou tratamento de data.
Entrega
O projeto deverá conter os 5 exercícios funcionando.

Todos os exercícios deverão estar no mesmo projeto Flutter.

Entregue o projeto completo compactado em formato:

.zip
 */