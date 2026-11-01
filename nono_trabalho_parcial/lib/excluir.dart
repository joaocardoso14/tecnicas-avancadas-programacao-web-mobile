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
  stdout.write('Digite o id do produto para excluir: ');
  
  String? entrada = stdin.readLineSync();
  int id = int.parse(entrada ?? '0');

  // Exclusão do produto
  final resposta = await cliente.from('produtos').delete().eq('id', id).select();

  // Se existe foi excluido se não não foi realizada
  if (resposta.isNotEmpty) {
    print('Produto excluído com sucesso: $resposta');
  } else {
    print('Nenhum produto encontrado com esse ID ou exclusão não realizada.');
  }

}