class CreatePerfils < ActiveRecord::Migration[6.0]
  def change
    create_table :perfils do |t|
      t.string :nome
      t.date :data_de_nascimento
      t.string :telefone

      t.timestamps
    end
  end
end
