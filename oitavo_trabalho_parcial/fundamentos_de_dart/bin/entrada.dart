import 'dart:io';

void main(){
  stdout.write("Qual seu nome?");
  String? n = stdin.readLineSync();
  // o interrogação serve para falar que é opcional, já que o readLineSync
  print("Boa tarde $n");
}