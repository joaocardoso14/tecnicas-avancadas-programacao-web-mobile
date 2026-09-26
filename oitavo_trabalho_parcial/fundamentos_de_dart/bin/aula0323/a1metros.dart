import 'dart:io';

void main(){
  stdout.write('Escreva um valor em metros(Ex de altura: 1.78)');
  double? m = double.tryParse(stdin.readLineSync()!) ?? 0.0;
  stdout.writeln("Em metros: $m m");
  double cm = m*100;
  stdout.writeln("Em centímetros: $cm cm");
  m == 0 
    ? stdout.writeln("(Se o valor aparecer 0.0, é porque o valor inserido não é apropiado)") 
    : stdout.writeln(" ");
}