import 'package:smile/model/BancoDeDados.dart';
import 'package:smile/model/Paciente.dart';

class LoginControlle {
// chamar o banco de dados, DatabaseHelp e o nome
//do seu banco de dados, Bancodedados.

  final Bancodedados bancodedados = Bancodedados();

  // metodo de entrar com email e senha.
  Future<Paciente?> loginWithEmailPassword(String email, String senha) async {
    // startar a variavel do banco de dados para iniciar o medoto.
    final db = await bancodedados.database;

    // listar os usuarios cadastrados no banco.
    final List<Map<String, dynamic>> lista = await db.query(
      'Paciente',
      where: 'emailPaciente =? AND senha =?',
      whereArgs: [email, senha],
    ); // final da verificação de email e senha no banco de dados

    if (lista.isNotEmpty) {
      return Paciente.fromMap(lista.first);
      // se lista não for null, retorna os dados db usuario.
    } else {
      return null;
      // se lista for nula, retorna null.
    }
  } // fim do metodo de autenticação com email e senha.
}
