import 'dart:io';

// 9) Confirmar ação
// Pergunte ao usuário: “Deseja continuar? (s/n)”.
// Leia a resposta e trate as opções informadas.

void main(){
  String resposta;
  do {
    stdout.writeln("Deseja continuar? (s/n)");
    resposta = stdin.readLineSync()!.toLowerCase();
    if (resposta == 's') {
      stdout.writeln("Continuando...");
    } else if (resposta == 'n') {
      stdout.writeln("Encerrando...");
    } else {
      stdout.writeln("Resposta inválida. Digite 's' para sim ou 'n' para não.");
    }
  } while (resposta != 's' && resposta != 'n');

}