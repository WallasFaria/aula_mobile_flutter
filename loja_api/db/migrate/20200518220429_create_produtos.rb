class CreateProdutos < ActiveRecord::Migration[6.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :descricao
      t.decimal :preco
      t.integer :estoque
      t.string :imagem

      t.timestamps
    end
  end
end
