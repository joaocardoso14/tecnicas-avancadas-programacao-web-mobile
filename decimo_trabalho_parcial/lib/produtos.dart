import 'package:all_br_forms/all_br_forms.dart';
import 'package:validatorless/validatorless.dart';
// flutter pub add all_br_forms validatorless
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// flutter pub add supabase_flutter

class ProdutoInsercaoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProdutoInsercaoState();
  }
}

class ProdutoInsercaoState extends State<ProdutoInsercaoPage> {
  GlobalKey<FormState> formularioChave = GlobalKey<FormState>();
  TextEditingController nomeControlador = TextEditingController();
  TextEditingController precoControlador = TextEditingController();
  TextEditingController quantidadeControlador = TextEditingController();

  double? converterPreco(String? texto) {
    String digitos = (texto ?? '').replaceAll(RegExp(r'\D'), '');
    return digitos.isEmpty ? null : int.parse(digitos) / 100;
  }

  String? validarPreco(String? valor) {
    double? preco = converterPreco(valor);

    if (preco == null) {
      return 'O campo preço é obrigatório';
    }

    return Validatorless.numbersBetweenInterval(
      0.10,
      99999.99,
      'O preço deve estar entre R\$ 0,10 e R\$ 99.999,99',
    )(preco.toString());
  }

  Future<void> salvar() async {
    FormState? formularioEstado = formularioChave.currentState;

    if (formularioEstado == null || !formularioEstado.validate()) {
      return;
    }

    await Supabase.instance.client.from('produtos').insert({
      'nome': nomeControlador.text.trim(),
      'preco': converterPreco(precoControlador.text),
      'quantidade': int.parse(quantidadeControlador.text),
    });

    if (!mounted) return;

    formularioEstado.reset();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Produto cadastrado com sucesso!')));


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Produto (Aula 06)')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formularioChave,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                controller: nomeControlador,
                validator: Validatorless.multiple([
                  Validatorless.required('O campo nome é obrigatório'),
                  Validatorless.between(
                    3,
                    50,
                    'O nome deve ter entre 3 e 50 caracteres',
                  ),
                ]),
                decoration: InputDecoration(
                  labelText: 'Nome do Produto',
                  hintText: 'Ex: Coca Cola 2 Litros',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                controller: precoControlador,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [CurrencyMask()],
                validator: validarPreco,
                decoration: InputDecoration(
                  labelText: 'Preço do Produto',
                  hintText: 'Ex: R\$ 12,50',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                controller: quantidadeControlador,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: Validatorless.multiple([
                  Validatorless.required('O campo quantidade é obrigatório'),
                  Validatorless.regex(
                    RegExp(r'^[1-9]\d*$'),
                    'A quantidade não pode começar com zero',
                  ),
                  Validatorless.numbersBetweenInterval(
                    1,
                    1000,
                    'A quantidade deve estar entre 1 e 1000',
                  ),
                ]),
                decoration: InputDecoration(
                  labelText: 'Quantidade do Produto',
                  hintText: 'Ex: 10',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 10),

              ElevatedButton(onPressed: salvar, child: Text('Salvar')),
            ],
          ),
        ),
      ),
    );
  }
}
