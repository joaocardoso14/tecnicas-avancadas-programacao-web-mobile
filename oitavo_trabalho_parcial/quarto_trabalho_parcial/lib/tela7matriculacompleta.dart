import 'package:flutter/material.dart';

class Tela7App extends StatelessWidget{
  const Tela7App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela 7 - Matrícula Completa',
      home: Tela7Page(),
    );
    
  }
}

class Tela7Page extends StatefulWidget{
  const Tela7Page({super.key});

@override
  State<StatefulWidget> createState() {
    return Tela7State();
    
  }
}

class Tela7State extends State<Tela7Page>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matrícula Completa'),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(100),

        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Qual é o seu nome?',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Qual é a sua idade?',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Qual é o nome do seu responsavel?',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Qual é o seu telefone?',
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

            DropdownButton<String>(
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

            ElevatedButton(
              onPressed: (){

              },
              child: Text('Enviar matricula'),
            ),
          ],
        )
      )
    );
  }
}