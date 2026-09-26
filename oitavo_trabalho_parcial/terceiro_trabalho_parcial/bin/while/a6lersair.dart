import 'dart:io';

//Ler até a palavra “sair”
// Leia palavras (strings) repetidamente até o usuário digitar sair.
// Ao final, mostre quantas palavras foram digitadas (não contar sair).
void main(){
  stdout.writeln("Digite uma palavra (\"sair\" para encerrar):");
  String palavra = stdin.readLineSync()!;
  int contador = 0;
  while(palavra != "sair"){
    contador++;
    stdout.writeln("Digite uma palavra (\"sair\" para encerrar):");
    palavra = stdin.readLineSync()!;
  }
  stdout.writeln("Quantidade de palavras digitadas: $contador");
}