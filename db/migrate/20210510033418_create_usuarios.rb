class CreateUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :usuarios do |t|
      t.string :nome_completo, null:false, default: ''
      t.date :data_nascimento, null:false, default: ''
      t.string :cpf, null:false, default: ''
      t.string :nome_mae, null:false, default: ''
      t.string :telefone, null:false, default: ''
      t.string :email, null:false, default: ''
      t.string :password_digest, null:false, default: ''

      t.timestamps
    end
  end
end
