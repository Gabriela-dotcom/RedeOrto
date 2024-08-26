import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  bool _isHealthProfessional = false;
  final TextEditingController _specializationController =
      TextEditingController();
  final TextEditingController _yearsOfExperienceController =
      TextEditingController();

  @override
  void dispose() {
    _specializationController.dispose();
    _yearsOfExperienceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Campo de nome
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu nome';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              // Campo de CPF
              TextFormField(
                decoration: InputDecoration(labelText: 'CPF'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu CPF';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              // Campo de telefone
              TextFormField(
                decoration: InputDecoration(labelText: 'Telefone'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu telefone';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              // Campo de endereço
              TextFormField(
                decoration: InputDecoration(labelText: 'Endereço'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu endereço';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              // Campo de data de nascimento
              TextFormField(
                decoration: InputDecoration(labelText: 'Data de Nascimento'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe sua data de nascimento';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              // Campo de altura
              TextFormField(
                decoration: InputDecoration(labelText: 'Altura (em cm)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe sua altura';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              // Campo de peso
              TextFormField(
                decoration: InputDecoration(labelText: 'Peso (em kg)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu peso';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              // Checkbox para profissional da saúde
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _isHealthProfessional,
                    onChanged: (bool? value) {
                      setState(() {
                        _isHealthProfessional = value ?? false;
                      });
                    },
                  ),
                  Text('Sou profissional da saúde'),
                ],
              ),
              if (_isHealthProfessional) ...[
                // Campo de especialização
                TextFormField(
                  controller: _specializationController,
                  decoration: InputDecoration(labelText: 'Especialização'),
                ),
                SizedBox(height: 10),
                // Campo de tempo de experiência
                TextFormField(
                  controller: _yearsOfExperienceController,
                  decoration: InputDecoration(
                      labelText: 'Tempo de experiência (em anos)'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
              ],
              // Botão de cadastro
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Processar os dados do formulário
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
