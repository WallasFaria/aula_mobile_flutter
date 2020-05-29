class AddUidToPerfils < ActiveRecord::Migration[6.0]
  def change
    add_column :perfils, :uid, :string
  end
end
