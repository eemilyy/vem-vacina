class CreateVacinas < ActiveRecord::Migration[6.1]
  def change
    create_table :vacinas do |t|
      t.string :nome_vacina, null: false
      t.text :localizacao, null: false
      t.date :data, null: false
      t.datetime :horario, null: false

      t.timestamps
    end
  end
end
