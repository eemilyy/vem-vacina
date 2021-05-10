class CreateVacinas < ActiveRecord::Migration[6.1]
  def change
    create_table :vacinas do |t|
      t.string :nome_vacina
      t.text :localizacao
      t.date :data
      t.time :horario

      t.timestamps
    end
  end
end
