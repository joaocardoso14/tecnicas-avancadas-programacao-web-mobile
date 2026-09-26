import 'package:flutter/material.dart';

class Tela3App extends StatelessWidget{
  const Tela3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela 3 - Checkbox',
      home: Tela3Page(),
    );
    
  }
}

class Tela3Page extends StatefulWidget{
  const Tela3Page({super.key});

@override
  State<StatefulWidget> createState() {
    return Tela3State();
    
  }
}

class Tela3State extends State<Tela3Page>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias'),
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


            CheckboxListTile(
              title: Text('Aceito receber novidades'),
              value: true,
              onChanged: (bool? value) {
                // Ação a ser executada quando o checkbox for alterado
              },
            ),
            CheckboxListTile(
              title: Text('Concordo com os termos'),
              value: false,
              onChanged: (bool? value) {
                // Ação a ser executada quando o checkbox for alterado
              },
            ),


          ],
        )
      )
    );
  }
}