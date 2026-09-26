import 'dart:io';

void main(){
  stdout.writeln("Digite um número (0 para sair)");
  int par = 0, impar = 0, n = int.parse(stdin.readLineSync()!);
  while(n != 0){
    if(n % 2 == 0){
      par++;
    } else {
      impar++;
    }
    stdout.writeln("Digite um número (0 para sair)");
    n = int.parse(stdin.readLineSync()!);
  }
  stdout.writeln("Quantidade de números pares: $par");
  stdout.writeln("Quantidade de números ímpares: $impar");



}