// Buscar um produto pelo código(por exemplo o produto 4(pelo id))
import 'package:supabase/supabase.dart';
import 'dart:io';

// Para resolver um erro que ocorre é utilizado o async e o await que permite o sistema aceitar algo não sincrono(tipo a verificação do bd que precisa esperar para funcionar)
void main() async {
  print('Tentando conectar');
  SupabaseClient cliente = SupabaseClient (
    'https://ezlclzwqqqgpzdgrmwxn.supabase.co',
    'sb_publishable_N4AZPC1256yuryOiypAF_g_KoS7MVD6'
  );
  print('Conexão estabelecida com sucesso');


  // ID do produto
  stdout.write('Digite o código do produto: ');
  
  String? entrada = stdin.readLineSync();
  int id = int.parse(entrada ?? '0');

  if (id == null) {
    print('ID inválido!');
    return;
  }

  // Nome do produto
  stdout.write('Digite o nome do produto: ');
  String? nome = stdin.readLineSync();

  // Preço do produto
  stdout.write('Digite o preco do produto: ');
  String? precoInicial = stdin.readLineSync();
  double? preco = double.tryParse(
    (precoInicial ?? '').replaceAll(',', '.'),
  );

  // Quantidade do produto
  stdout.write('Digite a quantidade do produto: ');
  String? qtd = stdin.readLineSync();

  if (preco == null) {
    print('Preço inválido!');
    return;
  }

  // Alteração do produto
  List<Map<String, dynamic>> lista = await cliente.from('produtos').update({
    'nome': nome,
    'preco': preco,
    'quantidade': qtd,
  }).eq('id', id).select();

  print('Listagem de produtos: $lista');
  print('Produto alterado com sucesso');
}