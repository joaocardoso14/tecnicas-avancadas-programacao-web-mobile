import 'package:flutter/material.dart';

class Atv1ImcApp extends StatelessWidget {
  const Atv1ImcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade 1 - IMC',
      home: Atv1ImcPage(),
    );
  }
}

class Atv1ImcPage extends StatefulWidget {
  const Atv1ImcPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Atv1ImcState();
  }
}

class Atv1ImcState extends State<Atv1ImcPage> {
  double peso = 0;
  int altura = 0;
  double imc = 0;
  String classificacao = '';

  TextEditingController pesoControlador = TextEditingController();
  TextEditingController alturaControlador = TextEditingController();

  void enviar(){ 
    setState(() { 
      peso = double.tryParse(pesoControlador.text) ?? 0;
      altura = int.tryParse(alturaControlador.text) ?? 0;
    });
    
    setState(() {
      imc = peso / ((altura / 100) * (altura / 100));
      if (imc < 18.5) {
        classificacao = 'Abaixo do peso';
      } else if (imc >= 18.5 && imc < 25) {
        classificacao = 'Peso normal';
      } else if (imc >= 25 && imc < 30) {
        classificacao = 'Sobrepeso';
      } else {
        classificacao = 'Obesidade';
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(200),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Qual é o seu peso? (em Kg)',
              ),
              controller: pesoControlador,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Qual é a sua altura? (em centimetros)',
              ),
              controller: alturaControlador,
            ),
            
            Text('O seu IMC é ${imc.toStringAsFixed(2)}. Classificação: $classificacao'), // toStringAsFixed(2) para limitar a quantidade de casas decimais

            ElevatedButton(
              onPressed: enviar,
              child: Text('Calcular IMC'),
            ),
          ],
        ),
      ),
    );
  }
}