import 'dart:io';

void main(){
  stdout.writeln('Vamos começar a calcular o valor rendido por voce taxista!');
  stdout.writeln('Digite o número do hodonometro ao inicio do dia:(Ex: 123) ');
  double? hodoinicio = double.tryParse(stdin.readLineSync()!) ?? 0.0;

  stdout.writeln('Digite o número do hodonometro ao final do dia:(Ex: 321) ');
  double? hodofim = double.tryParse(stdin.readLineSync()!) ?? 0.0;
  double km = hodofim - hodoinicio;
  //Valor percorrido no dia
  km <= 0 ? stdout.writeln("AVISO: voce inseriu algum valor de foma incorreta!!!") : stdout.writeln(" ");

  stdout.writeln('Digite o número de litros consumidos ao final do dia:(Ex: 20.4) ');
  double? litros = double.tryParse(stdin.readLineSync()!) ?? 0.0;
  double gasosa = litros * 6.5;
  //Valor de combustivel gasto no dia
  gasosa <= 0 ? stdout.writeln("AVISO: voce inseriu um valor inviavel!!!") : stdout.writeln(" ");

  stdout.writeln('Digite o valor ganho no dia:(Ex: 354.50) ');
  double? valor = double.tryParse(stdin.readLineSync()!) ?? 0.0;
  valor <= 0 ? stdout.writeln("AVISO: voce inseriu um valor inviavel!!!") : stdout.writeln(" ");

  double kml = km / litros;
  //pego o valor de km rodado, e vejo a média de consumo
  double lucro = valor - gasosa;
  //valor ganho hj menos o tanto de custo do combustivél

  stdout.writeln("Seu carro comsome, em média, $kml Km/L");
  stdout.writeln("O lucro ou prejuizo(se aparecer negativo) do dia é de R\$ $lucro");
}