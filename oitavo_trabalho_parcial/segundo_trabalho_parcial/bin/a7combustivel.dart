import 'dart:io';

void main(){
  stdout.writeln("Digite o número do combustivel desejavel: ");
  stdout.writeln("1 - Gasolina comum: R\$ 6,50 por litro");
  stdout.writeln("2 - Gasolina premium: R\$ 7,80 por litro");
  stdout.writeln("3 - Diesel: R\$ 5,90 por litro");
  stdout.writeln("4 - Álcool: R\$ 4,20 por litro");
  stdout.writeln("(Ex: 2): ");

  int? ngasosa = int.tryParse(stdin.readLineSync()!) ?? 0;

  if (ngasosa == 0) {
    stdout.writeln("Número digitado é invalido!");
    return;
  } 

  stdout.writeln("Digite a quantidade de litros desejada (Ex: 20.5): ");
  double? litros = double.tryParse(stdin.readLineSync()!) ?? 0;

  if (litros == 0) {
    stdout.writeln("O valor digitado é invalido!");
    return;
  }
  
  double valorTotal, valorUnit;

  if (ngasosa == 1) {
    valorUnit = 6.50;
  } else if (ngasosa == 2) {
    valorUnit = 7.80;
  } else if (ngasosa == 3) {
    valorUnit = 5.90;
  } else if (ngasosa == 4) {
    valorUnit = 4.20;
  } else {
    stdout.writeln("Número de combustivel digitado não existe!");
    return;
  }

  valorTotal = litros * valorUnit;

  stdout.writeln("O número do combustível é: ${ngasosa*1}");
  stdout.writeln("O valor unitário do combustível é: R\$ ${valorUnit.toStringAsFixed(2)}");
  stdout.writeln("O número de litros do combustível é: ${litros.toStringAsFixed(1)}");
  stdout.writeln("O valor total a ser pago é: R\$ ${valorTotal.toStringAsFixed(2)}");

}