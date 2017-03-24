class AddSqareFeetToApartments < ActiveRecord::Migration[5.0]
  def change
    add_column :apartments, :square_feet, :integer, default: 0
  end
end
