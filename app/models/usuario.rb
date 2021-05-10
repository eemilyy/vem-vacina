class Usuario < ApplicationRecord

    VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    has_secure_password

    validates :nome_completo, presence: true, length: {minimum:10}
    #validates :cpf, presence: true, 
    validates :password, length: {minimum:5}
    validates :nome_mae, presence: true, length: {minimum:10}
    validates :email, presence: true, length:{maximum: 255}, format:{with: VALID_EMAIL_REGEX}, uniqueness:{case_sensitive: true}
    validates_numericality_of :cpf, uniqueness: true
    validates_numericality_of :telefone, presence: true, length: {minimum:8}

    #attr_accessor :cpf, :usuario_id

    has_many :vacinas
    has_one :endereco

end
