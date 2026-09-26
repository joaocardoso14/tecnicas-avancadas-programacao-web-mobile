//O nome da classe não importa, não precisa ser igual ao nome do arquivo, mas é recomendado para melhor organização do código.

import 'package:flutter/material.dart';
//StatelessWidget: Widget que não tem estado, ou seja, não pode ser alterado depois de criado. Ele é imutável. Exemplo: Text, Icon, etc.
//StatefulWidget: Widget que tem estado, ou seja, pode ser alterado depois de criado. Ele é mutável. Exemplo: Checkbox, Radio, etc.

//statelesswidget >>>> material.dart

//App é o global, é normal ter apenas 1
class OlaMundoApp extends StatelessWidget {
  const OlaMundoApp({super.key});

  //comando build
  @override
  Widget build(BuildContext context) {
    //materialapp é o widget que representa o aplicativo, ele é o widget raiz do aplicativo, ele é responsável por configurar o tema, as rotas, etc. ("coisas globais")
    return MaterialApp(
      //titulo do app quando é instalado
      title: 'Fundamento nº 1 de Flutter ',
      home: OlaMundoPage(),
    );
  }
}

//Normal ter vários, cada um representando uma tela do aplicativo, ou seja, cada um representando uma página do aplicativo.
// (nas aulas será apenas 1, mas em um aplicativo real, é normal ter vários)
class OlaMundoPage extends StatefulWidget {
  const OlaMundoPage({super.key});

  @override
  State<OlaMundoPage> createState() {
    return OlaMundoState();
  } 
}

//Aqui é onde codamos, normal ter 1 por página, ou seja, 1 por tela do aplicativo.
class OlaMundoState extends State<OlaMundoPage> {
  @override
  Widget build(BuildContext context) {
    //Scaffold é o widget que representa a estrutura básica do aplicativo, ele é responsável por configurar a barra de navegação, o corpo do aplicativo, etc. ("coisas específicas da página")
    //è o minimizar do pc, o maximizar e o fechar do pc, ou seja, a estrutura básica do aplicativo.
    return Scaffold(
      //titulo da barra de navegação
      //widget dentro de widget, ou seja, widget aninhado
      appBar: AppBar(
        title: Text('Ola Mundo App'),
      ),
      //Center é um widget que centraliza o seu filho, ou seja, o widget que está dentro dele. Ele é responsável por centralizar o conteúdo da página.
      body: Center(
        child: Text('Olá Mundo Texto\' States'),
      ),
    );
  }
}
  