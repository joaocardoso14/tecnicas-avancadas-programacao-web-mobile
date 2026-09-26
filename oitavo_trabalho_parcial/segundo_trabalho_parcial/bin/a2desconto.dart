import 'dart:io';

void main(){
  stdout.writeln("Digite o preço do produto em reais (Ex: 99.99): ");
  double? valor = double.tryParse(stdin.readLineSync()!) ?? 0;
  
  stdout.writeln("Digite o código da sua região\nCódigo 1 – Região Norte: 5% de desconto.\nCódigo 2 – Região Sul: 15% de desconto.\nCódigo 3 – Região Sudeste: 7% de desconto.\nCódigo 4 – Região Nordeste: 12% de desconto.\nCódigo 5 – Região Centro-Oeste: 20% de desconto.\n(Ex: 2): ");

  int? codigo = int.tryParse(stdin.readLineSync()!) ?? 0;

  if (valor == 0 || codigo == 0) {
    stdout.writeln("Um dos valores digitados é invalido!");
    return;
  }
  switch (codigo) {
    case 1:
      valor *= 0.95;
      break;
    case 2:
      valor *= 0.85;
      break;
    case 3:
      valor *= 0.93;
      break;
    case 4:
      valor *= 0.88;
      break;
    case 5:
      valor *= 0.8;
      break;
    default:
    stdout.writeln("Código digitado não encontrado: Produto considerado importado, logo não haverá desconto");
}
  stdout.writeln("Valor final do produto após desconto: R\$ $valor");
}