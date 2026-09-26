import 'dart:io';

// 7) Menu de operações
// Exiba um menu com as opções:
// 1 – Somar
// 2 – Subtrair
// 0 – Sair
// O programa deve continuar exibindo o menu e lendo a opção do usuário até que ele escolha 0.

void main(){
  int opcao;
  do {
    stdout.writeln("1 – Somar");
    stdout.writeln("2 – Subtrair");
    stdout.writeln("0 – Sair");
    stdout.writeln("Escolha uma opção:");
    opcao = int.parse(stdin.readLineSync()!);
    switch(opcao) {
      case 1:
        stdout.writeln("Somar");
        break;
      case 2:
        stdout.writeln("Subtrair");
        break;
      case 0:
        stdout.writeln("Sair");
        break;
      default:
        stdout.writeln("Opção inválida");
    }
  } while(opcao != 0);
  stdout.writeln("Programa encerrado");
}