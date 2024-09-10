import 'package:flutter/material.dart';
import 'package:smile/view/CCadastro.dart';
import 'package:smile/view/Confirmacao_tratamento.dart';
import 'package:smile/view/LLogin.dart';
import 'package:smile/view/Pesquisa_tratamento.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/cadastro': (context) => Cadastro(),
        '/home': (context) => PesquisaTratamento(),
        '/controlemedidas': (context) => ConfirmacaoTratamento(
              tratamento: '',
              horario: '',
              profissional: '',
            ),
      },
    );
  }
}
