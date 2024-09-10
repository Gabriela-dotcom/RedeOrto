import 'package:flutter/foundation.dart';

class Atendimento {
  int? idAtendimento;
  DateTime? horarioAtendimento;
  DateTime? horarioFinalizado;

  // Construtor
  Atendimento({
    this.idAtendimento,
    this.horarioAtendimento,
    this.horarioFinalizado,
  });

  // Método que converte o objeto em Map
  Map<String, dynamic> toMap() {
    return {
      'idAtendimento': idAtendimento,
      'Horario_atendimento':
          horarioAtendimento?.toIso8601String(), // Converter para String
      'Horario_finalizado':
          horarioFinalizado?.toIso8601String(), // Converter para String
    };
  }

  // Método que cria um objeto a partir de um Map
  factory Atendimento.fromMap(Map<String, dynamic> map) {
    return Atendimento(
      idAtendimento: map['idAtendimento'],
      horarioAtendimento: DateTime.parse(map['Horario_atendimento']),
      horarioFinalizado: DateTime.parse(map['Horario_finalizado']),
    );
  }
}
