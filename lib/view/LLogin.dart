import 'package:flutter/material.dart';
import 'package:smile/control/loginController.dart';
import 'package:smile/model/Paciente.dart';
import 'package:smile/view/CCadastro.dart';
import 'package:smile/view/Pesquisa_tratamento.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginControlle _controller = LoginControlle();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _senhacontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // metodo de usuario logar
  Future<void> logindousuario() async {
    // criar try catch para tratar erros

    try {
      //variavel para acessar o LoginController
      //criar um objeto da tela model
      Paciente? paciente = await _controller.loginWithEmailPassword(
          _emailcontroller.text, _senhacontroller.text);
      //verificar se o usuario retornado veio vazio, ou com informações.

      if (paciente != null) {
        // se paciente for diferente de null
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PesquisaTratamento(),
          ),
        );
      } else {
        // não encontrou ninguem com email e senha informado.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Senha ou E-mail Incorretos!"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 10),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro ao Entrar!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 10),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Slime'), // Logo do aplicativo
          ],
        ),
        backgroundColor: Colors.blue, // Cor da barra superior
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _emailcontroller,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira o email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _senhacontroller,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira a senha';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        // Substituindo o botão "Entrar com Google" por "Fazer Cadastro"
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.pink, // Cor do botão
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Cadastro(),
                              ),
                            );
                          },
                          child: const Text('Fazer Cadastro'),
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                Colors.blue, // Cor do botão "Próximo"
                          ),
                          onPressed: logindousuario,
                          child: Text('Próximo'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Desenvolvido por Gabriela - 2024',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Controlador do Login
class LoginController {
  set email(String email) {}
  set password(String password) {}
}

// Exemplo de próxima página
class ProximaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Próxima Página'),
      ),
      body: Center(
        child: Text('Bem-vindo à próxima página!'),
      ),
    );
  }
}
