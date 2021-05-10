class Vacina < ApplicationRecord

    validates :nome_vacina, presence: true
    validates :localizacao, presence: true, length: {minimum: 8}

    belongs_to :usuario

end
