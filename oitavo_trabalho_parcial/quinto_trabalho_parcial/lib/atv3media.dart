import 'package:flutter/material.dart';

class Atv3MediaApp extends StatelessWidget {
  const Atv3MediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade 3 - Média',
      home: Atv3MediaPage(),
    );
  }
}

class Atv3MediaPage extends StatefulWidget {
  const Atv3MediaPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Atv3MediaState();
  }
}

class Atv3MediaState extends State<Atv3MediaPage> {
  TextEditingController nota1Controller = TextEditingController();
  TextEditingController nota2Controller = TextEditingController();
  TextEditingController recuperacaoController = TextEditingController();

  bool temRecuperacao = false;

  String resultado = '';

  void calcular() {
    double nota1 = double.parse(nota1Controller.text);
    double nota2 = double.parse(nota2Controller.text);

    double media = (nota1 + nota2) / 2;

    if (temRecuperacao) {
      double recuperacao =
          double.parse(recuperacaoController.text);

      media = (media + recuperacao) / 2;
    }

    setState(() {
      if (media >= 6) {
        resultado =
            'Média: ${media.toStringAsFixed(2)}\nAprovado';
      } else {
        resultado =
            'Média: ${media.toStringAsFixed(2)}\nReprovado';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aprovado/Reprovado com Média'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nota1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nota 1',
              ),
            ),

            TextField(
              controller: nota2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nota 2',
              ),
            ),

            Row(
              children: [
                Checkbox(
                  value: temRecuperacao,
                  onChanged: (value) {
                    setState(() {
                      temRecuperacao = value!;
                    });
                  },
                ),
                Text('Tem recuperação?'),
              ],
            ),

            if (temRecuperacao)
              TextField(
                controller: recuperacaoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Nota da recuperação',
                ),
              ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: calcular,
              child: Text('Calcular'),
            ),

            SizedBox(height: 20),

            Text(
              resultado,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}