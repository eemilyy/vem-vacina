require "test_helper"

class EnderecoTest < ActiveSupport::TestCase
  test 'nao deve salvar endereco com letras dentro do campo cep' do
    usuario = Usuario.new nome_completo: 'Yasmin Martins',
    data_nascimento: '1996/Jun/26',
    cpf: '22348665450',
    nome_mae: 'Aline Nina',
    telefone: '8127754305',
    endereco_attributes:{cep: 'abc12345',
    cidade: 'Caruaru',
    bairro: 'Salgado',
    logradouro: '2ª Travessa Martins Francisco',
    complemento: 'Apartamento 14'},
    email: 'yasmin@gmail.com',
    password: 'uqaC7xdwdJ'  
 
    assert_not usuario.save
  end

  test 'nao deve salvar endereco com o campo logradouro vazio' do
    usuario = Usuario.new nome_completo: 'Yasmin Martins',
    data_nascimento: '1996/Jun/26',
    cpf: '22348665450',
    nome_mae: 'Aline Nina',
    telefone: "8127754305",
    endereco_attributes:{cep: '55020362',
    cidade: 'Caruaru',
    bairro: 'Salgado',
    logradouro: '',
    complemento: 'Apartamento 14'},
    email: 'yasmin@gmail.com',
    password: 'uqaC7xdwdJ'  
 
    assert_not usuario.save
  end

  test 'nao deve salvar endereco com o campo cidade menor do que o minimo exigido' do
    usuario = Usuario.new nome_completo: 'Yasmin Martins',
    data_nascimento: '1996/Jun/26',
    cpf: '22348665450',
    nome_mae: 'Aline Nina',
    telefone: '8127754305',
    endereco_attributes:{cep: '55020362',
    cidade: 'C',
    bairro: 'Salgado',
    logradouro: '2ª Travessa Martins Francisco',
    complemento: 'Apartamento 14'},
    email: 'yasmin@gmail.com',
    password: 'uqaC7xdwdJ'  
 
    assert_not usuario.save
  end

  test 'deve salvar endereco criado corretamente' do
    usuario = Usuario.new nome_completo: 'Yasmin Martins',
    data_nascimento: '1996/Jun/26',
    cpf: '22348665450',
    nome_mae: 'Aline Nina',
    telefone: '8127754305',
    endereco_attributes:{cep: '55020362',
    cidade: 'Caruaru',
    bairro: 'Salgado',
    logradouro: '2ª Travessa Martins Francisco',
    complemento: 'Apartamento 14'},
    email: 'yasmin@gmail.com',
    password: 'uqaC7xdwdJ'  
 
    assert usuario.save
  end
end
