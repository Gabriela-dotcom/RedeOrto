import 'package:flutter/material.dart';
import 'confirmacao_tratamento.dart';

class PesquisaTratamento extends StatefulWidget {
  @override
  _PesquisaTratamentoState createState() => _PesquisaTratamentoState();
}

class _PesquisaTratamentoState extends State<PesquisaTratamento> {
  final List<Map<String, dynamic>> _tratamentos = [
    {
      'nome': 'Limpeza Dental',
      'exame': 'Consulta inicial',
      'descricao':
          'Remoção de tártaro e placa bacteriana para manter a saúde bucal.',
      'profissional': 'Dra. Juliana Souza',
      'horarios': ['09:00', '11:00', '15:00']
    },
    {
      'nome': 'Clareamento Dental',
      'exame': 'Avaliação de dentes',
      'descricao': 'Tratamento para clarear dentes amarelados ou manchados.',
      'profissional': 'Dr. Marcos Silva',
      'horarios': ['10:00', '13:00', '16:00']
    },
    {
      'nome': 'Canal',
      'exame': 'Radiografia do dente',
      'descricao':
          'Tratamento para remover o tecido infectado da raiz do dente.',
      'profissional': 'Dra. Paula Oliveira',
      'horarios': ['08:00', '14:00', '17:00']
    },
    {
      'nome': 'Implante Dentário',
      'exame': 'Tomografia computadorizada',
      'descricao': 'Substituição de dentes perdidos por próteses fixas.',
      'profissional': 'Dr. Ricardo Santos',
      'horarios': ['07:00', '12:00', '18:00']
    },
  ];

  String _searchQuery = '';
  Map<String, dynamic>? _selectedTreatment;
  String? _selectedHorario;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _filteredTratamentos = _tratamentos
        .where((tratamento) => tratamento['nome']!
            .toLowerCase()
            .contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisar Tratamento'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.blue.shade800],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Campo de pesquisa
              TextField(
                decoration: InputDecoration(
                  labelText: 'Digite o nome do tratamento',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.3),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
              SizedBox(height: 20),
              // Lista de tratamentos filtrados
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredTratamentos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16),
                        title: Text(
                          _filteredTratamentos[index]['nome']!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(
                                'Exame: ${_filteredTratamentos[index]['exame']!}'),
                            SizedBox(height: 5),
                            Text(
                                'Descrição: ${_filteredTratamentos[index]['descricao']!}'),
                            SizedBox(height: 5),
                            Text(
                                'Profissional: ${_filteredTratamentos[index]['profissional']!}'),
                            SizedBox(height: 10),
                            // Dropdown de horários disponíveis
                            Text('Horário disponível:'),
                            DropdownButton<String>(
                              value: _selectedTreatment ==
                                      _filteredTratamentos[index]
                                  ? _selectedHorario
                                  : null,
                              hint: Text('Selecione um horário'),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedTreatment =
                                      _filteredTratamentos[index];
                                  _selectedHorario = newValue;
                                });
                              },
                              items: _filteredTratamentos[index]['horarios']
                                  .map<DropdownMenuItem<String>>(
                                      (String horario) {
                                return DropdownMenuItem<String>(
                                  value: horario,
                                  child: Text(horario),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        // Botão para confirmar a seleção do tratamento e ir para a próxima tela
                        trailing: ElevatedButton(
                          onPressed: _selectedTreatment ==
                                      _filteredTratamentos[index] &&
                                  _selectedHorario != null
                              ? () {
                                  // Navegar para a próxima tela com os detalhes do tratamento
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ConfirmacaoTratamento(
                                        tratamento: _filteredTratamentos[index]
                                            ['nome']!,
                                        horario: _selectedHorario!,
                                        profissional:
                                            _filteredTratamentos[index]
                                                ['profissional']!,
                                      ),
                                    ),
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text('Confirmar'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
