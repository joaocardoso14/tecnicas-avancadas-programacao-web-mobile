import 'dart:io';

void main() {
  print('Digite um número inteiro (0 para sair):');
  int n = int.parse(stdin.readLineSync()!);
  int soma = 0;
  int quantidade = 0;

  while (n != 0) {
    soma += n;
    quantidade++;
    print('Digite um número inteiro (0 para sair):');
    n = int.parse(stdin.readLineSync()!);
  }

  print('A soma dos números digitados é: $soma');
  print('A quantidade de números digitados é: $quantidade');
}