// classe para listar, cadastrar e atualizar usuarios.

import 'package:smile/model/Adm.dart';
import 'package:smile/model/BancoDeDados.dart';

class ProfissionalControler {
  // start no banco de dados.
  // estrutura para criar objetos.
  final Bancodedados bancodedados = Bancodedados();

  // metodo de cadastro de usuarios.
  // User é o nome da Classe model.
  Future<int> addAdm(Adm usuario) async {
    // criando uma variavel de banco de dados, para salvar dados.
    // serve para conectar o metodo ao banco de dados.
    final db = await bancodedados.database;

    // mandar os dados ao banco.
    // user e o nome da tabela.
    return await db.insert('Adm', usuario.toMap());
  } // final do metodo de cadastro do usuário.

  // metodo de excluir usuario.
  Future<int> deletarAdm(int, id) async {
    // cria variavel de banco de dados para acessar os metodos.
    final db = await bancodedados.database;
    // excluir o usuario dentro do banco de dados.
    return await db.delete('Adm', where: 'id =?', whereArgs: [id]);
    /* delete o registro dentro da tabela user, onde id de usuario for
    igual ao id passado no metodo deletarUsuario */
  }

  // metodo para editar o usuario
  Future<int> editarAdm(Adm usuario) async {
    // criar variavel de banco de dados para acessar os metodos
    final db = await bancodedados.database;
    // atualizar os dados do usuario no banco.
    return await db.update('Adm', usuario.toMap(),
        where: 'id = ?', whereArgs: [usuario.idAdm]);
    /* atuatlizar dentro da tabela user, os dados novos dos usuarios onde id da 
    tabela do uduario e igaul id do usuario passado. */
  }

  // metodo de listar usuario

  Future<List<Adm>> getUser() async {
    // criar variavel do banco de dados para usar os metodos
    final db = await bancodedados.database;
    // criar variavel para receber a lista dos usuarios do banco de dados
    final List<Map<String, dynamic>> listadeAdm = await db.query('Adm');
    /* variavel do tipo lista, que recebe uma map de String dinamicas
    que recebe todos os dados da tabela usuario do banco. */

    /* percorra a lista de usuario e mande/retorne todos os dados 
    para o metodo fromMap de classe model User */
    return List.generate(listadeAdm.length, (int i) {
      return Adm.fromMap(listadeAdm[i]);
    });
  }
} // fim da classe UserControler.
