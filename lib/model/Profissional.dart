class Profissional {
  int? idProfissional;
  String? nameProfissional;
  String? specialization;
  String? cpf;
  String? teleProfess;
  String? emailProfess;

  Profissional({
    this.idProfissional,
    this.nameProfissional,
    this.specialization,
    this.cpf,
    this.teleProfess,
    this.emailProfess,
  });

  // this referencia uso de variavel local (contida na classe)

  // metodo que converte o objeto user em map
  Map<String, dynamic> toMap() {
    return {
      'id': idProfissional,
      'nomeProfissional': nameProfissional,
      'specializacao': specialization,
      'Cpf': cpf,
      'telefone': teleProfess,
      'email': emailProfess,
    };
  }

  // cria um objeto de uso da classe, a apartir de um não
  factory Profissional.fromMap(Map<String, dynamic> map) {
    return Profissional(
      idProfissional: map['idProfissional'],
      nameProfissional: map['nameProfissional'],
      specialization: map['specialization'],
      cpf: map['cpf'],
      teleProfess: map['telefone'],
      emailProfess: map['emailProfess'],
    );
  } // final do factory
}
