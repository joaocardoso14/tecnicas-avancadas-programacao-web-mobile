import 'dart:io';

void main(){
  stdout.writeln("Digite o valor do seu salário bruto em reais(Ex: 2300.70): ");
  double? salbruto = double.tryParse(stdin.readLineSync()!) ?? 0;

  if (salbruto == 0) {
    stdout.writeln("O valor digitado é invalido!");
    return;
  }
  double salliquido;
  if (salbruto > 10000.0) {
    salliquido = salbruto * 0.8;
  } else if (salbruto > 5000.01 && salbruto <= 10000.0) {
    salliquido = salbruto * 0.85;
  } else if (salbruto > 2000.01 && salbruto <= 5000.0) {
    salliquido = salbruto * 0.9;
  } else {
    salliquido = salbruto;
  }
  stdout.writeln("Valor do seu salário liquido é de R\$ $salliquido");

}