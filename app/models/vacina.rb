class Vacina < ApplicationRecord

    validates :nome_vacina, presence: true
    validates :localizacao, presence: true

    belongs_to :usuario

end
