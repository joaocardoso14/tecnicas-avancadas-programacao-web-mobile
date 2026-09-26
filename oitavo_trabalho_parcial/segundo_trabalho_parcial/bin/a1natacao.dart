import 'dart:io';

void main(){
  stdout.writeln("Digite o valor nadado em metros(Ex: 1000): ");
  double? valor = double.tryParse(stdin.readLineSync()!) ?? 0;

  if (valor == 0) {
    stdout.writeln("Valor digitado é invalido!");
    return;
  }

  if (valor < 800) {
    stdout.writeln("Seu premio é de R\$ 5.000,00");
  } else if (valor >= 800 || valor < 1500) {
    stdout.writeln("Seu premio é de R\$ 10.000,00");
  } else{
    stdout.writeln("Seu premio é de R\$ 15.000,00");
  }
}