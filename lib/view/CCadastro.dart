import 'package:flutter/material.dart';
import 'package:smile/control/userControler.dart';
import 'package:smile/view/LLogin.dart';

// Aqui você pode importar a tela de login quando implementada
// import 'package:smile/view/Login.dart';

import 'package:smile/model/Paciente.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _telefoneController.dispose();
    _idadeController.dispose();
    _cidadeController.dispose();
    _cpfController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  // Método para salvar cadastro.
  void salvarCadastro() async {
    try {
      UserControler userControler = UserControler();
      Paciente paciente = Paciente(
        namePaciente: _nomeController.text,
        numberPaciente: _telefoneController.text,
        city: _cidadeController.text,
        cpf: _cpfController.text,
        emailPaciente: _emailController.text,
        senha: _senhaController.text,
        age: _idadeController.text,
      );

      int userId = await userControler.addUser(paciente);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Cadastro realizado com sucesso!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5),
        ),
      );

      // navegar até a tela login depois do cadastro
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Cadastro não realizado. $e"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(color: Colors.pink),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu nome';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _telefoneController,
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  labelStyle: TextStyle(color: Colors.pink),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu telefone';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _idadeController,
                decoration: InputDecoration(
                  labelText: 'Idade',
                  labelStyle: TextStyle(color: Colors.pink),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe sua idade';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _cidadeController,
                decoration: InputDecoration(
                  labelText: 'Cidade',
                  labelStyle: TextStyle(color: Colors.pink),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe sua cidade';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _cpfController,
                decoration: InputDecoration(
                  labelText: 'CPF',
                  labelStyle: TextStyle(color: Colors.pink),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu CPF';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Colors.pink),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu e-mail';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.pink),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe sua senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    salvarCadastro();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text('Cadastrar'),
              ),
              SizedBox(height: 10),
              // Botão para voltar à tela de login
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Cadastro(),
  ));
}
