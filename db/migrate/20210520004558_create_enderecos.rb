class CreateEnderecos < ActiveRecord::Migration[6.1]
  def change
    create_table :enderecos do |t|
      t.string :cep
      t.string :cidade
      t.string :bairro
      t.string :logradouro
      t.string :complemento
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
