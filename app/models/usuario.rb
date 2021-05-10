class Usuario < ApplicationRecord

    has_secure_password

    validates :nome_completo, presence: true, length: {minimum:10}
    validates :cpf, presence: true, numericality: { only_integer: true }
    validates :password, length: {minimum:5}
    validates :nome_mae, presence: true, length: {minimum:10}
    validates :email, presence: true
    validates :telefone, presence: true, length: {minimum:8}

end
