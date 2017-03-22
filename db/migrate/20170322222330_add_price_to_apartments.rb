class AddPriceToApartments < ActiveRecord::Migration[5.0]
  def change
    add_column :apartments, :price, :decimal, :precision => 10, :scale => 2
  end
end
