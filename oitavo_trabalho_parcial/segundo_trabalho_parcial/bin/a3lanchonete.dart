import 'dart:io';

void main(){
  stdout.writeln("Digite o código do produto desejado:\nLanche -- Código -- Valor (R\$)\nCachorro Quente -- 101 -- 14,20 \nBauru Simples -- 102 -- 12,30 \nBauru com Ovo -- 103 -- 13,50 \nHambúrguer -- 104 -- 10,20 \nCheeseburger -- 105 -- 15,30 \nRefrigerante -- 106 -- 10,00 \n(Ex: 101): ");
  int? codigo = int.tryParse(stdin.readLineSync()!) ?? 0;

  stdout.writeln("Digite o número de produtos voce deseja: (Ex: 3)");
  int? qtde = int.tryParse(stdin.readLineSync()!) ?? 0;

  if (codigo == 0 || qtde == 0) {
    stdout.writeln("Um dos valores digitados é invalido!)");
    return;
  }

  double valor;
  switch (codigo) {
    case 101: 
    valor = 14.20 * qtde;
      break;
    case 102:
      valor = 12.30 * qtde;
      break;
    case 103:
      valor = 13.50 * qtde;
      break;
    case 104:
      valor = 10.20 * qtde;
      break;
    case 105:
      valor = 15.30 * qtde;
      break;
    case 106:
      valor = 10.0 * qtde;
      break;
    default:
    stdout.writeln("Código do lanche inválido");
    return;
  }
  stdout.writeln("O preço total ficou R\$ $valor");

}