// Lembrar de instalar biblioteca do supabase em pubsec.yaml através do terminal, usando:
// flutter pub add supabase_flutter - para flutter
// flutter pub add supabase - para dart

import 'package:supabase/supabase.dart';

void main () {
  // Primeiro url, dps senha pública
  // Disponível em 'conexao' lá no supabase
  SupabaseClient cliente = SupabaseClient (
    'https://ezlclzwqqqgpzdgrmwxn.supabase.co',
    'sb_publishable_N4AZPC1256yuryOiypAF_g_KoS7MVD6'
  );
  
  print('Conexão estabelecida com sucesso!');

}