Feature: Vacinas
  As a usuario do sistema de agendamentos de vacinas VEM VACINA
  I want to cadastrar, editar e apagar os dados referentes ao agendamento de vacinas
  So that eu consiga fazer de maneira simples

  Scenario: cadastrar novo agendamento para vacina
    Given eu estou logado no sistema Vem Vacina e dentro de Agendamento Vacinas
    And eu seleciono a opcao de Cadastrar nova vacina
    When eu preencho o Nome Vacina 'COVID-19', Localizacao 'Rua Doze, 12', a Data '12'/'June'/'2021' e o Horario '13':'30'
    And clico no botao de 'Create Vacina'
    Then vejo uma mensagem informando que 'Agendamento criado com sucesso'

  Scenario: apagar agendamento de uma vacina
    Given eu estou logado no sistema Vem Vacina e dentro de Agendamento Vacinas
    And procuro manualmente na pagina de Agendamento Vacinas o nome da vacina e encontro 'COVID-19'
    When seleciono o botao de Destroy para o agendamento da vacina 'COVID-19'
    Then vejo uma mensagem informando que 'Agendamento apagado com sucesso'
  
  Scenario: cadastrar agendamento de vacina com campo Nome Vacina e Localizacao com apenas 1 caractere
    Given eu estou logado no sistema Vem Vacina e dentro de Agendamento Vacinas
    And eu seleciono a opcao de Cadastrar nova vacina
    When eu preencho o Nome Vacina '1', Localizacao '2', a Data '12'/'June'/'2021' e o Horario '13':'30'
    And clico no botao de 'Create Vacina'
    Then vejo uma mensagem de erro informando os campos que estao incorretos

  Scenario: editar dados do agendamento de uma vacina com campos Nome Vacina e Localizacao vazios
    Given eu estou logado no sistema Vem Vacina e dentro de Agendamento Vacinas
    And procuro manualmente na pagina de Agendamento Vacinas o nome da vacina e encontro 'COVID-19'
    When clico na opcao de editar o agendamento da vacina 'COVID-19'
    And eu preencho o Nome Vacina '', Localizacao '', a Data '12'/'June'/'2021' e o Horario '13':'30'
    When clico no botao de 'Update Vacina'
    Then vejo uma mensagem de erro informando os campos que estao incorretos