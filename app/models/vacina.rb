class Vacina < ApplicationRecord
    belongs_to :usuario

    validates :nome_vacina, presence: true, length: {minimum: 3}
    validates :localizacao, presence: true, length: {minimum: 8}
    validates_date :data, timeliness: {on_or_after: lambda { Date.current }, type: :date}   
    validates_time :horario, between: ['9:00am', '5:00pm']
end
