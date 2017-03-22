class CreateApartments < ActiveRecord::Migration[5.0]
  def change
    create_table :apartments do |t|
      t.string :address
      t.string :url
      t.string :img
      t.boolean :email_sent
      t.datetime :viewing_date
      t.timestamps
    end
  end
end
