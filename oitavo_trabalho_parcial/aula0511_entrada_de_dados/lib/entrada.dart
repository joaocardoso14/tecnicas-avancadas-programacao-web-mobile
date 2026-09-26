import 'package:flutter/material.dart';
// SEMPRE 'MATERIAL'

class EntradaApp extends StatelessWidget {
  const EntradaApp({super.key});
 // 1 Aplicativo
  @override
  Widget build(BuildContext context) { // Build 
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tira a faixa de debug em cima da execução
      title: 'APP 2 - Entrada de dados', // Título do aplicativo
      home: EntradaPage(), // Página inicial do aplicativo, a primeira a ser exibida, a raiz da árvore de widgets, o ponto de partida do aplicativo
    );
  }
}

// Página stateless, sem estado, sem interação, sem mudança de dados, apenas exibição de informações
// Como a tela da história da Fatec, por exemplo

// Página stateful, com estado, com interação, com mudança de dados
// Como a tela de login, por exemplo
class EntradaPage extends StatefulWidget {
  const EntradaPage({super.key});
 // cada app com suas n Páginas
  @override
  State<StatefulWidget> createState() { // createState
    return EntradaState(); // Estado dessa página
  }
}

class EntradaState extends State<EntradaPage> { // e cada página com seu único Estado
  String nome = ''; // Variável tem que ser global
  int ano = 0;

  // Controlador serve para auxiliar widgets visuais, modifica-los
  TextEditingController nomeControlador = /* new não é obrigatório*/ TextEditingController();
  TextEditingController idadeControlador = TextEditingController();

  void enviar(){ // Método do botão, futuramente colocar até em outros arquivos
    // "Programação funcional" possui o método anonimo
    setState(() { // "Método anonimo", por é usado apenas uma vez
      // Padrão para atualizar em tela os dados
      nome = nomeControlador.text; // Apenas salvo na memória, precisa dar refresh para aparecer na tela
      // ano = int.tryParse(idadeControlador.text) ?? 0;
      // ano = 2026 - ano; 
    });
    
    int idade = int.tryParse(idadeControlador.text) ?? 0;
    /*Pode ter 2 na função normal*/setState(() {
      ano = DateTime.now().year /*2026*/ - idade;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page/State - Entrada de Dados')
        ),
      body: Padding( // Espaçamento interno do body, para não ficar colado nas bordas da tela
        padding: EdgeInsetsGeometry.all(200), // 200 pixels de espaçamento em todas as direções
        child: Column( // Coluna, para organizar os widgets em vertical
          children: [ // Como se fosse um vetor, chamado de 'filhos' e coleção
            TextField( // Campo de texto, para entrada de dados
              decoration: InputDecoration(
                labelText: 'Qual é o seu nome?',
              ),
              controller: nomeControlador,
            ),

            SizedBox( // Espaçamento entre widgets, para não ficar colado
              height: 100, // 100 pixels de altura
            ),

            TextField(
              decoration: InputDecoration(
                labelText: 'Qual é a sua idade?',
              ),
              controller: idadeControlador,
            ),

            SizedBox(
              height: 100,
            ),

            Text('Boa tarde $nome! Você nasceu em $ano!'),

            SizedBox(
              height: 100,
            ),

            ElevatedButton(
              onPressed: enviar,
              child: Text('Enviar'), // De preferencia criar em um outro método em aplicações maiores a lógica do botão
              
            ),
          ],
        )
      ), 


      // Sem padding

      // body: Column(
      //   children: [
      //     TextField(
      //       decoration: InputDecoration(
      //         labelText: 'Qual é o seu nome?',
      //       ),
      //     ),
      //     SizedBox(
      //       height: 100,
      //     ),
      //     TextField(
      //       decoration: InputDecoration(
      //         labelText: 'Qual é a sua idade?',
      //       ),
      //     ),
      //   ],
      //),


      // Caso fosse aparecer apenas um textField

      // body: TextField(
      //   decoration: InputDecoration(
      //     labelText: 'Qual é o seu nome?',
      //   ),
      //),

    );
  }
}