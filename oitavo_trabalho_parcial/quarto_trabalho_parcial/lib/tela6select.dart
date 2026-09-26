import 'package:flutter/material.dart';

class Tela6App extends StatelessWidget{
  const Tela6App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela 6 - Seleção',
      home: Tela6Page(),
    );
    
  }
}

class Tela6Page extends StatefulWidget{
  const Tela6Page({super.key});

@override
  State<StatefulWidget> createState() {
    return Tela6State();
    
  }
}

class Tela6State extends State<Tela6Page>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleção de curso'),
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


            DropdownButton<String>(
              value: 'adm',
              hint: Text('Selecione um curso'),
              items: [
                DropdownMenuItem(
                  value: 'adm',
                  child: Text('Administração'),
                ),
                DropdownMenuItem(
                  value: 'eletronica',
                  child: Text('Eletrônica'),
                ),
                DropdownMenuItem(
                  value: 'info',
                  child: Text('Informática'),
                ),
              ],
              onChanged: (value) {
                // Ação a ser executada quando o dropdown for alterado
              },
            ),


          ],
        )
      )
    );
  }
}