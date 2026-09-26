import 'dart:io';

void main(){
  double nota;
  do {
    stdout.writeln("Digite uma nota entre 0 e 10:");
    nota = double.parse(stdin.readLineSync()!);
    if (nota < 0 || nota > 10) {
      stdout.writeln("Nota inválida. Tente novamente.");
    }
  } while (nota < 0 || nota > 10);
  stdout.writeln("Nota válida: $nota");
}