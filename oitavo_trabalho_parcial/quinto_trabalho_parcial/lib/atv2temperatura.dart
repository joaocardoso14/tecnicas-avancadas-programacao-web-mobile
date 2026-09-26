import 'package:flutter/material.dart';

class Atv2TemperaturaApp extends StatelessWidget {
  const Atv2TemperaturaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade 2 - Temperatura',
      home: Atv2TemperaturaPage(),
    );
  }
}

class Atv2TemperaturaPage extends StatefulWidget {
  const Atv2TemperaturaPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Atv2TemperaturaState();
  }
}

class Atv2TemperaturaState extends State<Atv2TemperaturaPage> {
  double temperaturaCelsius = 0;
  double temperaturaFahrenheit = 0;
  String? tipoTemperatura;

  TextEditingController temperaturaController = TextEditingController();

  void converter() {
    setState(() {
      if (tipoTemperatura == 'CF') {
        temperaturaCelsius = double.parse(temperaturaController.text);
        temperaturaFahrenheit = (temperaturaCelsius * 9 / 5) + 32;
      } else if (tipoTemperatura == 'FC') {
        temperaturaFahrenheit = double.parse(temperaturaController.text);
        temperaturaCelsius = (temperaturaFahrenheit - 32) * 5 / 9;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Temperatura'),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(200),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Digite a temperatura',
              ),
              controller: temperaturaController,
            ),
            DropdownButton<String>(
              value: tipoTemperatura,
              hint: Text('Selecione uma conversão'),
              items: [
                DropdownMenuItem(
                  value: 'CF',
                  child: Text('Celsius → Fahrenheit'),
                ),
                DropdownMenuItem(
                  value: 'FC',
                  child: Text('Fahrenheit → Celsius'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  tipoTemperatura = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: converter,
              child: Text('Converter'),
            ),
            SizedBox(height: 20),
            Text('Temperatura em Celsius: ${temperaturaCelsius.toStringAsFixed(2)}'),
            Text('Temperatura em Fahrenheit: ${temperaturaFahrenheit.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}