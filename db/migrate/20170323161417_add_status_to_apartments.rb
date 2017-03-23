class AddStatusToApartments < ActiveRecord::Migration[5.0]
  def change
    add_reference :apartments, :status, foreign_key: true, default: 2
  end
end
