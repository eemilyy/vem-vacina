require "test_helper"

class UsuarioTest < ActiveSupport::TestCase
  test 'deve salvar usuario criado corretamente com todos os campos preenchidos' do
    usuario = Usuario.new nome_completo: 'Joao da Silva',
    data_nascimento: '2010/May/12',
    cpf: '12345678911',
    nome_mae: 'Maria Silva',
    telefone: '12345678',
    endereco_attributes:{cep: '87654321',
    cidade: 'Sao Paulo',
    bairro: 'Jardins',
    logradouro: 'Rua Zero, 123',
    complemento: 'Ap. 105'},
    email: 'joaodasilva@gmail.com',
    password: '00000000'  
 
    assert usuario.save
  end

  test 'nao deve salvar usuario com letras dentro do campo telefone' do
    usuario = Usuario.new nome_completo: 'Joao da Silva',
    data_nascimento: '2010/May/12',
    cpf: '12345678911',
    nome_mae: 'Maria Silva',
    telefone: "abc123456",
    endereco_attributes:{cep: '87654321',
    cidade: 'Sao Paulo',
    bairro: 'Jardins',
    logradouro: 'Rua Zero, 123',
    complemento: 'Ap. 105'},
    email: 'joaodasilva@gmail.com',
    password: '00000000'  
 
    assert_not usuario.save
  end

  test 'nao deve salvar usuario com campo de nome_completo vazio' do
    usuario = Usuario.new nome_completo: '',
    data_nascimento: '2010/May/12',
    cpf:'12345678911',
    nome_mae: 'Maria Silva',
    telefone: "abc123456",
    endereco_attributes:{cep: '87654321',
    cidade: 'Sao Paulo',
    bairro: 'Jardins',
    logradouro: 'Rua Zero, 123',
    complemento: 'Ap. 105'},
    email: 'joaodasilva@gmail.com',
    password: '00000000'  
 
    assert_not usuario.save
  end

  test 'nao deve salvar usuario com o cpf menor do que o tamanho exigido' do
    usuario = Usuario.new nome_completo: 'Joao da Silva',
    data_nascimento: '2010/May/12',
    cpf: '1234',
    nome_mae: 'Maria Silva',
    telefone: "abc123456",
    endereco_attributes:{cep: '87654321',
    cidade: 'Sao Paulo',
    bairro: 'Jardins',
    logradouro: 'Rua Zero, 123',
    complemento: 'Ap. 105'},
    email: 'joaodasilva@gmail.com',
    password: '00000000'  
 
    assert_not usuario.save
  end
end
