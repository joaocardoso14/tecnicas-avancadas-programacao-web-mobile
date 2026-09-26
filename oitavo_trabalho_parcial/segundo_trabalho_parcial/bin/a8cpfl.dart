import 'dart:io';

void main(){
  stdout.writeln("Digite o valor de energia consumida em kWh");
  stdout.writeln("Até 100 kWh: R\$ 0,80 por kWh");
  stdout.writeln("De 101 a 300 kWh: R\$ 1,10 por kWh");
  stdout.writeln("De 301 a 500 kWh: R\$ 1,40 por kWh");
  stdout.writeln("Acima de 500 kWh: R\$ 1,80 por kWh");
  stdout.writeln("(Ex: 360): ");
  int? kmh = int.tryParse(stdin.readLineSync()!) ?? 0;

  if (kmh == 0) {
    stdout.writeln("O valor digitado é invalido!");
    return;
  }
  bool taxa = kmh > 400;
  double valorTotal, valorUnit;

  if (kmh <= 100) {
    valorUnit = 0.80;
  } else if (kmh > 100 && kmh <= 300) {
    valorUnit = 1.10;
  } else if (kmh > 300 && kmh <= 500) {
    valorUnit = 1.40;
  } else {
    valorUnit = 1.80;
  }
  valorTotal = kmh * valorUnit;
  stdout.writeln("Consumo de energia: $kmh kWh");
  stdout.writeln("Valor unitário: R\$ ${valorUnit.toStringAsFixed(2)}");
  taxa == true ? stdout.writeln("Taxa aplicada. No valor de R\$ ${valorTotal*0.10}") : stdout.writeln("Nenhuma taxa aplicada.");
  stdout.writeln("O valor semi total: R\$ ${valorTotal.toStringAsFixed(2)}");
  taxa == true ? stdout.writeln("O valor total a ser pago é: R\$ ${(valorTotal*1.10).toStringAsFixed(2)}") : stdout.writeln("O valor total a ser pago é: R\$ ${valorTotal.toStringAsFixed(2)}");
  

}