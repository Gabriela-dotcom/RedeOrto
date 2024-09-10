# Arquitetura do projeto (MVC)

Para a criação do Slime foi utilizado a arquitetura MVC:

- **Model**: Pasta na qual fica os arquivos de 
 armazenamento de dados do (Paciente, Profissional, Hoario e dia das consultas ).
- **View**: Pasta na qual fica a interface da aplicação. Telas de Cadastro de usuário,
 Tela de pesquisa, e a de confirmação.
- **Control**: Pasta que realiza o processo de intermediação entre **Model** e **View**, sendo
 responsável pelo gerenciamento dos dados entre telas e banco de dados. 

# Fluxo dos Dados

 - O usuário interage com as telas **(View)**, como por exemplo 
 "clicar em um botão de salvar cadastro".
 - A classe Usercontroller **(Control)** é chamada e registra todos os 
 dados do usuario dentro das variaveis do user **(Model)**.
 - O user **(Model)** ela envia e/ou recebe os dados do banco de dados Sqlite.
 - O UserController **(Controller)** retorna os dados para a tela **(View)**.

 ![Diagrama de caso de uso](docs/DiagramaDeCasoDeUso1.png)

 # Banco de Dados

 ![Diagrama conceitual de banco de dados](docs/DiagramaConceitualredeorto.png)
 
  ' Tabela Paciente '
  **idPaciente** : identificador unico para o paciente
  **nome**: nome do Paciente
  **numero**: numero do Paciente
  **cidade**: cidade onde esse paciente se encontra
  **cpf**: cpf do paciente
  **idade**: idade do paciente

  ' Tabela Profissional '
  **idProfissional**: identificador unico para o profissional
  **nome**: nome do profissional
  **numero**: numero do profissional
  **cpf**: cpf do profissional
  **email**: email do profissional

  ' Tabela Adm '
  **idAdm**: identificador unico para o Adm
  **nome**: nome do adm
  **numero**: numero do adm
  **cpf**: cpf do adm
  **email**: email do adm
  **idProfissional**: chave secundaria para cadastro/agendamento

  ' Tabela Atendimento '
  **id**: identificador unico de atendimento
  **Horario_atendimento**: horario que inicia o atendimento
  **Horario_finalizado**: horario que termina o atendimento
  **idProfissional**: chave secundaria de identificador de Profissional
  **idPaciente**: chave secundaria de identificador de Paciente

 
