import 'dart:io';

void main() {
  print('Digite um número inteiro:');
  int n = int.parse(stdin.readLineSync()!);

  print('Contagem regressiva:');
  for (int i = n; i >= 0; i--) {
    print(i);
  }
}