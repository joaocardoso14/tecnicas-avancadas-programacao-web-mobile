import 'package:flutter/material.dart';

class Tela1App extends StatelessWidget{
  const Tela1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela 1 - Login',
      home: Tela1Page(),
    );
    
  }
}

class Tela1Page extends StatefulWidget{
  const Tela1Page({super.key});

@override
  State<StatefulWidget> createState() {
    return Tela1State();
    
  }
}

class Tela1State extends State<Tela1Page>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
            TextField(
              decoration: InputDecoration(
                labelText: 'Qual é a sua idade?',
              ),
            ),


            ElevatedButton(
              onPressed: () {
                // Ação a ser executada quando o botão for pressionado
              },
              child: Text('Entrar'),
            ),

            
          ],
        )
      )
    );
  }
}