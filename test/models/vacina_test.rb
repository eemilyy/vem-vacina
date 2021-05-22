require "test_helper"

class VacinaTest < ActiveSupport::TestCase
  test "deve salvar vacina cadastrada corretamente" do
    usuario = Usuario.new nome_completo: 'Renata Vanessa Ramos',
      data_nascimento: '1988/Mar/24',
      cpf: '18930872638',
      nome_mae: 'Sara Cecilia',
      telefone: '985857096',
      endereco_attributes:{cep: '32606672',
      cidade: 'Betim',
      bairro: 'Conjunto Habitacional Homero Gil',
      logradouro: 'Rua Antonio Lambertucci',
      complemento: 'Casa 6154'},
      email: 'renatava@hotmail.com',
      password: 'cormgqBkiu'  
  
      usuario.save

    vacina = Vacina.new nome_vacina: 'COVID-19',
      localizacao: 'Rua Santo Amaro, 152. UBS Amaro',
      data: '2021/Dec/10',
      horario: '13:30',
      usuario_id: usuario.id

      assert vacina.save
  end

  test "nao deve salvar vacina cadastrada com o campo de localizacao vazio" do
    usuario = Usuario.new nome_completo: 'Renata Vanessa Ramos',
      data_nascimento: '1988/Mar/24',
      cpf: '18930872638',
      nome_mae: 'Sara Cecilia',
      telefone: '985857096',
      endereco_attributes:{cep: '32606672',
      cidade: 'Betim',
      bairro: 'Conjunto Habitacional Homero Gil',
      logradouro: 'Rua Antonio Lambertucci',
      complemento: 'Casa 6154'},
      email: 'renatava@hotmail.com',
      password: 'cormgqBkiu'  
   
      usuario.save
  
    vacina = Vacina.new nome_vacina: 'COVID-19',
      localizacao: '',
      data: '2021/Dec/10',
      horario: '13:50',
      usuario_id: usuario.id
  
      assert_not vacina.save
  end

  test "nao deve salvar vacina cadastrada com o campo de nome_vacina menor que o tamanho exigido" do
    usuario = Usuario.new nome_completo: 'Renata Vanessa Ramos',
      data_nascimento: '1988/Mar/24',
      cpf: '18930872638',
      nome_mae: 'Sara Cecilia',
      telefone: '985857096',
      endereco_attributes:{cep: '32606672',
      cidade: 'Betim',
      bairro: 'Conjunto Habitacional Homero Gil',
      logradouro: 'Rua Antonio Lambertucci',
      complemento: 'Casa 6154'},
      email: 'renatava@hotmail.com',
      password: 'cormgqBkiu'  
    
      usuario.save
  
    vacina = Vacina.new nome_vacina: 'C',
      localizacao: 'Rua Santo Amaro, 152. UBS Amaro',
      data: '2021/Dec/10',
      horario: '13:50',
      usuario_id: usuario.id
  
      assert_not vacina.save
  end

  test "nao deve salvar vacina cadastrada com o horario acima do horario permitido" do
    usuario = Usuario.new nome_completo: 'Renata Vanessa Ramos',
      data_nascimento: '1988/Mar/24',
      cpf: '18930872638',
      nome_mae: 'Sara Cecilia',
      telefone: '985857096',
      endereco_attributes:{cep: '32606672',
      cidade: 'Betim',
      bairro: 'Conjunto Habitacional Homero Gil',
      logradouro: 'Rua Antonio Lambertucci',
      complemento: 'Casa 6154'},
      email: 'renatava@hotmail.com',
      password: 'cormgqBkiu'  
    
      usuario.save
  
    vacina = Vacina.new nome_vacina: 'COVID-19',
      localizacao: 'Rua Santo Amaro, 152. UBS Amaro',
      data: '2021/Dec/10',
      horario: '23:50',
      usuario_id: usuario.id
  
      assert_not vacina.save
  end
end
