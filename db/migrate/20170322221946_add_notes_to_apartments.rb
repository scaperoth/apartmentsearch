class AddNotesToApartments < ActiveRecord::Migration[5.0]
  def change
    add_column :apartments, :notes, :text, default: nil
  end
end
