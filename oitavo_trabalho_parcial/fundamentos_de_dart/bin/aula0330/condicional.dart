import 'dart:io';

void main(){
  stdout.writeln("Digite o valor percorrido em metros(Ex: 1000)");
  String? valor = stdin.readLineSync();

  if (valor == null || valor.isEmpty) {
    stdout.writeln("O campo de valor percorrido é obrigatório!");
    return;
    //Return é um sair, exit, entrou aqui ele não executa mais o restante do código
  }

  double? distancia = double.tryParse(valor)?? 0.0;
  double? premio;

  if (distancia < 800) {
    premio = 5000;
  } else if (distancia >=800 && distancia < 1500) {
    premio = 10000;
  } else {
    premio = 15000;
  }

  stdout.writeln("Seu premio é de R\$ $premio");

}