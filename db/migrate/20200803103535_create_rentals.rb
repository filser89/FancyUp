class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.string :name
      t.string :category
      t.string :occasion
      t.string :size
      t.boolean :available
      t.boolean :rented
      t.string :color
      t.references :user, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
