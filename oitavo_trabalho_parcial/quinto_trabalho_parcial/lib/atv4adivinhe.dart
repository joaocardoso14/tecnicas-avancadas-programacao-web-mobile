import 'dart:math';
import 'package:flutter/material.dart';

class Atv4AdivinheApp extends StatelessWidget {
  const Atv4AdivinheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade 4 - Adivinhe',
      home: Atv4AdivinhePage(),
    );
  }
}

class Atv4AdivinhePage extends StatefulWidget {
  const Atv4AdivinhePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Atv4AdivinheState();
  }
}

class Atv4AdivinheState extends State<Atv4AdivinhePage> {
 TextEditingController palpiteController =
      TextEditingController();

  int numeroSecreto = 0;
  int tentativas = 0;

  String mensagem =
      'Tente adivinhar um número entre 1 e 100';

  @override
  void initState() {
    super.initState();

    numeroSecreto = Random().nextInt(100) + 1;
  }

  void tentar() {
    int palpite = int.parse(palpiteController.text);

    setState(() {
      tentativas++;

      if (palpite < numeroSecreto) {
        mensagem = 'Maior ↑';
      } else if (palpite > numeroSecreto) {
        mensagem = 'Menor ↓';
      } else {
        mensagem =
            '🎉 Acertou! Número: $numeroSecreto';
      }
    });

    palpiteController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adivinhe o Número'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: palpiteController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite seu palpite',
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: tentar,
              child: Text('Tentar'),
            ),

            SizedBox(height: 20),

            Text(
              mensagem,
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 10),

            Text(
              'Tentativas: $tentativas',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}