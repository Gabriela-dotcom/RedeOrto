import 'package:flutter/material.dart';
// muitas interfaces pré-prontas

/* classe obrigatoria em toda tela, ela é responsável por definir o estado de mudança dos widgets
o widget statefulwidget permite a randenização dos componentes de interface

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

// classe de criação de interface

class _LoginState extends State<Login> {
  final formkey = GlobalKey<FormState>();

// variaveis de formulario

  final emailUsuario = TextEditingController();
  final senhaUsuario = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //metodo de retorno dos widgents
      appBar: AppBar(
        title: Text('Tela de Login'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        // definindo margem para os widgets
        padding: const EdgeInsets.all(16.0), // margem de 16
        child: Form(
          // criando uma formulario com margens
          key: formkey, //chave do formulario
          child: Column(
            // colocando os itens em colunas
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Entre com sua senha",
                ),
                obscureText: true, // ocultar senha
                validator: (String? senha) {
                  if (senha == null || senha.isEmpty) {
                    return 'Por favor entre com sua senha';
                  }
                  return null;
                },
              ), // final TextFormFild
              SizedBox(
                height: 20,
              ), // espaço entre os dados do usuario
              ElevatedButton(
                onPressed: () {},
                child: Text('Entrar'),
              ), // final do botão
            ], // final de children (filhos) da coluna
          ), // fim da coluna
        ), // fim da formulario
      ),
      // fim do padding / rodape
    ); // final scaffold

    throw UnimplementedError();
  } // final widgents

// aqui dentro ficará os icones, botões, imagens e demais partes do design
} // final classe LoginState


*/