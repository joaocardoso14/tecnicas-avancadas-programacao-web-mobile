import 'dart:io';

void main() {
  print('Digite um número inteiro:');
  int n = int.parse(stdin.readLineSync()!);

  int soma = 0;
  for (int i = 1; i <= n; i++) {
    soma += i;
  }
  print('A soma de 1 até $n é: $soma');
}