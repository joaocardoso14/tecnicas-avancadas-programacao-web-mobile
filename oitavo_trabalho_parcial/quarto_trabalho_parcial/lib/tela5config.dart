import 'package:flutter/material.dart';

class Tela5App extends StatelessWidget{
  const Tela5App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela 5 - Configurações',
      home: Tela5Page(),
    );
    
  }
}

class Tela5Page extends StatefulWidget{
  const Tela5Page({super.key});

@override
  State<StatefulWidget> createState() {
    return Tela5State();
    
  }
}

class Tela5State extends State<Tela5Page>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(200),

        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Qual é o seu nome?',
              ),
            ),


            SwitchListTile(
              title: Text('Ativar notificações'),
              value: true,
              onChanged: (bool value) {
                // Ação a ser executada quando o switch for alterado
              },
            ),
            SwitchListTile(
              title: Text('Modo escuro'),
              value: false,
              onChanged: (bool value) {
                // Ação a ser executada quando o switch for alterado
              },
            ),


          ],
        )
      )
    );
  }
}