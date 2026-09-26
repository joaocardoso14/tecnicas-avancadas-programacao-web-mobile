import 'dart:io';

void main(){
  stdout.write('Escreva seu salário por hora trabalhada(Ex: 19.55)');
  double? sal = double.tryParse(stdin.readLineSync()!) ?? 0.0;
  stdout.write('Escreva quantas horas são trabalhadas por mes(Ex: 120)');
  int? horas = int.tryParse(stdin.readLineSync()!) ?? 0;
  double salariomensal = sal * horas;
  stdout.writeln("Seu salario é de R\$ $salariomensal");
  salariomensal == 0 
    ? stdout.writeln("(Se o valor aparecer 0.0, é porque um dos valores inseridos não é apropiado)") 
    : stdout.writeln(" ");
}