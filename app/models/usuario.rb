class Usuario < ApplicationRecord
    has_secure_password
    has_many :vacinas
    has_one :endereco
    accepts_nested_attributes_for :endereco, update_only: true

    VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    validates :nome_completo, presence: true, length: {minimum:10}, numericality: false
    validates_date :data_nascimento, on_or_before: lambda { Date.current }   
    validates :cpf, presence: true, uniqueness: true, length: {is: 11}, numericality: { only_integer: true }
    validates :nome_mae, presence: true, length: {minimum:10}, numericality: false
    validates :email, presence: true, length:{maximum: 255}, format:{with: VALID_EMAIL_REGEX}, uniqueness:{case_sensitive: true}
    validates :telefone, presence: true, length: {minimum:8}, numericality: { only_integer: true }
    validates :password, presence: true, length: {minimum:8}

end
