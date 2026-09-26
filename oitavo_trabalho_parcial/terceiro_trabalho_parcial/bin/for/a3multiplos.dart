import 'dart:io';
void main() {
  print('Digite um número inteiro:');
  int n = int.parse(stdin.readLineSync()!);
  print('Digite outro número inteiro:');
  int k = int.parse(stdin.readLineSync()!);

  int quantidade = 0;
  for (int i = n; i >= 1; i--) {
    if (i % k == 0) {
      quantidade++;
    }
  }

  print('A quantidade de múltiplos de $k de 1 até $n é: $quantidade');
}