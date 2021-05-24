Given ('eu estou logado no sistema Vem Vacina e dentro de Agendamento Vacinas') do
    visit '/usuarios/new'
    fill_in 'usuario_nome_completo', with: 'Janaina de Albuquerque'
    select '1990', :from => 'usuario_data_nascimento_1i'
    select 'May', :from => 'usuario_data_nascimento_2i'
    select '10', :from => 'usuario_data_nascimento_3i'
    fill_in 'usuario_cpf',	with: '12345678999' 
    fill_in 'usuario_nome_mae',	with: 'Samira Silva' 
    fill_in 'usuario_telefone',	with: '87412365' 
    fill_in 'usuario_endereco_attributes_cep',	with: '97465321' 
    fill_in 'usuario_endereco_attributes_cidade',	with: 'Recife' 
    fill_in 'usuario_endereco_attributes_bairro',	with: 'São João' 
    fill_in 'usuario_endereco_attributes_logradouro',	with: 'Rua da Paz' 
    fill_in 'usuario_endereco_attributes_complemento',	with: 'numero 321' 
    fill_in 'usuario_email',	with: 'maria@gmail.com' 
    fill_in 'usuario_password', with: 'password'
    click_on 'Create Usuario'

    #logar no sistema
    click_on 'LOGIN'
    fill_in 'session_cpf', with: '12345678999'
    fill_in 'session_password',with: 'password'
    click_on 'Entrar'

    #entrar em agendamentos
    click_on 'Ver Agendamentos'
end

And ("eu seleciono a opcao de Cadastrar nova vacina") do
    click_on 'New Vacina'
end

When ('eu preencho o Nome Vacina {string}, Localizacao {string}, a Data {string}\/{string}\/{string} e o Horario {string}:{string}') do |string, string2, string3, string4, string5, string6, string7|    
    fill_in 'vacina_nome_vacina', with: string
    fill_in 'vacina_localizacao', with: string2
    select string3, :from => 'vacina_data_3i'
    select string4, :from => 'vacina_data_2i'
    select string5, :from => 'vacina_data_1i'
    select string6, :from => 'vacina_horario_4i'
    select string7, :from => 'vacina_horario_5i'
end

And ('clico no botao de {string}') do |string|
    click_on string
end

Then('vejo uma mensagem informando que {string}') do |string|
    expect(page).to have_content(string)
end

#-----------------------------------

And ('procuro manualmente na pagina de Agendamento Vacinas o nome da vacina e encontro {string}') do |string|
    click_on 'New Vacina'
    fill_in 'vacina_nome_vacina', with: string
    fill_in 'vacina_localizacao', with: 'Rua Doze, 12'
    select '12', :from => 'vacina_data_3i'
    select 'June', :from => 'vacina_data_2i'
    select '2021', :from => 'vacina_data_1i'
    select '13', :from => 'vacina_horario_4i'
    select '30', :from => 'vacina_horario_5i'
    click_on 'Create Vacina'
    
    click_link 'Back'
    
    expect(page).to have_content(string)
end

When('seleciono o botao de Destroy para o agendamento da vacina {string}') do |string|
    click_link "d-#{string}"
end

#---------------------------------------

Then('vejo uma mensagem de erro informando os campos que estao incorretos') do
    assert_selector('div#error_explanation')
end