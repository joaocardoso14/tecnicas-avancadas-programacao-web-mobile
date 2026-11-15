import 'package:flutter/material.dart';
import 'package:decimo_trabalho_parcial/produtos.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// flutter pub add supabase_flutter

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://ezlclzwqqqgpzdgrmwxn.supabase.co',
    publishableKey: 'sb_publishable_N4AZPC1256yuryOiypAF_g_KoS7MVD6',
  );

  runApp(AMSApp());
}

class AMSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto AMS',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: ProdutoInsercaoPage(),
    );
  }
}
