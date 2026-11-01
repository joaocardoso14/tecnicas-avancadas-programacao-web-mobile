import 'package:supabase/supabase.dart';

// Para resolver um erro que ocorre é utilizado o async e o await que permite o sistema aceitar algo não sincrono(tipo a verificação do bd que precisa esperar para funcionar)
void main() async {
  print('Tentando conectar');
  SupabaseClient cliente = SupabaseClient (
    'https://ezlclzwqqqgpzdgrmwxn.supabase.co',
    'sb_publishable_N4AZPC1256yuryOiypAF_g_KoS7MVD6'
  );
  print('Conexão estabelecida com sucesso');

  // Mapa chave valor
  // Mapa <Chave/Trava do tipo String e do tipo dynamic>
  List<Map<String, dynamic>> lista = await cliente.from('produtos').select(); // na tabela produtos quero que liste tudo

  print('Listagem de produtos: $lista');

}

// Buscar um produto pelo código(por exemplo o produto 4(pelo id))
// Excluir por código
// Editar por código