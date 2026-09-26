import 'dart:io';

void main(){
  stdout.write('Digite um valor para ser depositado a uma poupança(Ex: 1000.99)');
  double? deposito = double.tryParse(stdin.readLineSync()!) ?? 0.0;
  stdout.writeln("Esse é o valor rendido ao longo do ano(taxa de 0,5%)");
  
  //Fazendo se fosse ao longo do ano
  //for (var i = 1; i < 12; i++) {
    //deposito *= 1.005;
    //stdout.writeln("Valor rendido no $i º mes: R\$ $deposito");
    
  //}
  
  double rendeu = deposito * 1.005;
  stdout.writeln("Valor rendido no próximo mes: R\$ $rendeu");
  rendeu/*ou deposito pro outro caso*/ == 0 
    ? stdout.writeln("(Se o valor aparecer 0.0, é porque o valor inserido não é apropiado)") 
    : stdout.writeln(" ");
  
  
}