class Adm {
  int? idAdm;
  String? nameAdm;
  String? emailAdm;
  String? numberAdm;
  String? cpfAdm;

  // construtor - chamada da classe que recebe os dados
  Adm({
    this.idAdm,
    this.nameAdm,
    this.emailAdm,
    this.numberAdm,
    this.cpfAdm,
  });

  // this referencia uso de variavel local (contida na classe)

  // metodo que converte o objeto user em map
  Map<String, dynamic> toMap() {
    return {
      'id': idAdm,
      'nomePaciente': nameAdm,
      'email': emailAdm,
      'number': numberAdm,
      'cpfAdm': cpfAdm,
    };
  }

  // cria um objeto de uso da classe, a apartir de um não
  factory Adm.fromMap(Map<String, dynamic> map) {
    return Adm(
      idAdm: map['idAdm'],
      nameAdm: map['nameAdm'],
      emailAdm: map['emailAdm'],
      numberAdm: map['numberAdm'],
      cpfAdm: map['cpfAdm'],
    );
  } // final do factory
}
