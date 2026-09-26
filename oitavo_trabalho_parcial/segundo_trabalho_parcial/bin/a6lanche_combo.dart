import 'dart:io';
//Uma lanchonete está enfrentando dificuldades para atender certos pedidos devido a restrições em algumas combinações do cardápio. As regras são as seguintes:
// O lanche Bauru não pode ser acompanhado de Guaraná.
// Se o cliente escolher X-Frango, não poderá pedir Água.
// Ao pedir Pizza, as únicas bebidas permitidas são Vinho ou Água.

// Com base nessas restrições, desenvolva um programa que leia o lanche e a bebida escolhidos pelo cliente e determine se o pedido pode ou não ser atendido.

void main(){
  stdout.write("Digite o lanche: ");
  String lanche = stdin.readLineSync()!.toUpperCase();
  
  stdout.write("Digite a bebida: ");
  String bebida = stdin.readLineSync()?.toUpperCase() ?? " ";

  if (lanche.isEmpty || lanche == " " || bebida.isEmpty || bebida == " ") {
    stdout.writeln("Entrada inválida!");
    return;
  }
  
  bool pedidoValido = validarPedido(lanche, bebida);
  
  if (pedidoValido) {
    stdout.writeln("Pedido aceito!");
  } else {
    stdout.writeln("Pedido recusado!");
  }
}

bool validarPedido(String lanche, String bebida) {
  if (lanche == "BAURU" && bebida == "GUARANÁ") {
    return false;
  }
  
  if (lanche == "X-FRANGO" && bebida == "ÁGUA") {
    return false;
  }
  
  if (lanche == "PIZZA" && bebida != "VINHO" && bebida != "ÁGUA") {
    return false;
  }
  
  return true;
}