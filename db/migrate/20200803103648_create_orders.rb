class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :status, default: "pending"
      t.references :rental, null: false, foreign_key: true

      t.timestamps
    end
  end
end
