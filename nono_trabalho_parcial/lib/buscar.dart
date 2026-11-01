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

  stdout.write('Digite o código do produto: ');
  
  String? entrada = stdin.readLineSync();
  int id = int.parse(entrada ?? '0');

  List<Map<String, dynamic>> lista = await cliente.from('produtos').select().eq('id', id);

  print('Listagem de produtos: $lista');
}