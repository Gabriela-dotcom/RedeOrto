import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Bancodedados {
  // Classe para criar o banco de dados

  // Criar uma instância do banco de dados
  static final Bancodedados _instancia = Bancodedados._internal();

  // Instanciando
  factory Bancodedados() => _instancia;

  // Protocolo de segurança contra instâncias duplicadas
  Bancodedados._internal();

  // Referência para o banco de dados
  static Database? _database;

  // Getter para acessar o banco de dados
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Inicializar o banco de dados se ainda não tiver sido iniciado
    _database = await _initDatabase();
    return _database!; // Retorna o banco de dados iniciado
  }

  // Método de inicialização do banco de dados
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    // Obter o caminho do diretório do banco de dados
    final path = join(dbPath, 'Smile_database.db');
    // 'Smile_database.db' é o nome do banco de dados

    // Abre o banco de dados e, caso ele não exista, o método cria o BD
    return await openDatabase(
      path,
      version: 1, // Versão do banco de dados
      onCreate: _onCreate, // Método para criar o banco de dados
      // onUpgrade: _onUpgrade, // Atualiza o banco de dados caso necessário
    );
  }

  // Método de criação do banco de dados
  Future _onCreate(Database db, int version) async {
    // Criando as tabelas
    await db.execute('''
      CREATE TABLE Paciente(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nomePaciente TEXT,
        NumeroPaciente INTEGER,
        cidade TEXT,
        cpf TEXT,
        emailPaciente TEXT,
        senha TEXT,
        Idade TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE Profissional(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nameProfissional TEXT,
        numberProfiss TEXT,
        cpf TEXT,
        emailProfiss TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE Adm(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nameAdm TEXT,
        numberAdm TEXT,
        cpf TEXT,
        emailAdm TEXT,
        idProfissional INTEGER,
        FOREIGN KEY (idProfissional) REFERENCES Profissional(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE Atendimento(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        Horario_atendimento TEXT,
        Horario_finalizado TEXT,
        idProfissional INTEGER,
        idPaciente INTEGER,
        FOREIGN KEY (idProfissional) REFERENCES Profissional(id),
        FOREIGN KEY (idPaciente) REFERENCES Paciente(id)
      )
    ''');
  } // Fim do método de criação do banco de dados

  // Método para atualizar o banco de dados, caso queira mudar
  /*Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Se a versão antiga for menor que 2
      await db.execute('''
        -- Adicione as instruções de atualização aqui
      ''');
    }
  }*/
}
