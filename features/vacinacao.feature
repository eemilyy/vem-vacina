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