class AddUsuarioToVacinas < ActiveRecord::Migration[6.1]
  def change
    add_reference :vacinas, :usuario, foreign_key: true
  end
end
