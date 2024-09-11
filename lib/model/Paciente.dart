class Paciente {
  int? idPaciente;
  String? namePaciente;
  String? numberPaciente;
  String? city;
  String? cpf;
  String? emailPaciente;
  String? senha;
  String? age;

  // construtor - chamada da classe que recebe os dados
  Paciente(
      {this.idPaciente,
      this.namePaciente,
      this.numberPaciente,
      this.city,
      this.cpf,
      this.emailPaciente,
      this.senha,
      this.age});

  // this referencia uso de variavel local (contida na classe)

  // metodo que converte o objeto user em map
  Map<String, dynamic> toMap() {
    return {
      'id': idPaciente,
      'nomePaciente': namePaciente,
      'NumeroPaciente': numberPaciente,
      'cidade': city,
      'Cpf': cpf,
      'emailPaciente': emailPaciente,
      'senha': senha,
      'Idade': age,
    };
  }

  // cria um objeto de uso da classe, a apartir de um não
  factory Paciente.fromMap(Map<String, dynamic> map) {
    return Paciente(
      idPaciente: map['idpaciente'],
      namePaciente: map['namePaciente'],
      numberPaciente: map['numberPaciente'],
      age: map['age'],
      city: map['city'],
      emailPaciente: map['emailPaciente'],
      senha: map['senha'],
    );
  } // final do factory
}
