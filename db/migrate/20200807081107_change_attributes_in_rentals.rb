class ChangeAttributesInRentals < ActiveRecord::Migration[6.0]
  def change
    change_column :rentals, :available, :boolean, default: true
    change_column :rentals, :rented, :boolean, default: false

  end
end
