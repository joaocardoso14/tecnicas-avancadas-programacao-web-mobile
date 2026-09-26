import 'package:flutter/material.dart';

class Tela4App extends StatelessWidget{
  const Tela4App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela 4 - Radio Button',
      home: Tela4Page(),
    );
    
  }
}

class Tela4Page extends StatefulWidget{
  const Tela4Page({super.key});

@override
  State<StatefulWidget> createState() {
    return Tela4State();
    
  }
}

class Tela4State extends State<Tela4Page>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha de turno'),
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


            RadioListTile(
              title: Text('Manhã'),
              value: 'manha',
              groupValue: 'turno',
              onChanged: (value) {
                // Ação a ser executada quando o radio button for alterado
              },
            ),
            RadioListTile(
              title: Text('Tarde'),
              value: 'tarde',
              groupValue: 'turno',
              onChanged: (value) {
                // Ação a ser executada quando o radio button for alterado
              },
            ),
            RadioListTile(
              title: Text('Noite'),
              value: 'noite',
              groupValue: 'turno',
              onChanged: (value) {
                // Ação a ser executada quando o radio button for alterado
              },
            ),


          ],
        )
      )
    );
  }
}