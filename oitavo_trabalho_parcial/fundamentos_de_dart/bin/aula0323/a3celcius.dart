import 'dart:io';

void main(){
  stdout.write('Escreva uma temperatura em Celsius(ºC)(Ex: 30.5)');
  double? celsius = double.tryParse(stdin.readLineSync()!) ?? 0.0;
  double fahren = (celsius * 9 / 5) + 32;
  stdout.writeln("Em Celsius: $celsius ºC");
  stdout.writeln("Em Fahrenheit: $fahren ºF");
  fahren == 0 
    ? stdout.writeln("(Se o valor aparecer 0.0, é porque o valor inserido não é apropiado)") 
    : stdout.writeln(" ");
}