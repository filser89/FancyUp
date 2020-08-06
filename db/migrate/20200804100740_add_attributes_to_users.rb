class AddAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickName, :string
    add_column :users, :country, :string
    add_column :users, :gender, :string
    add_column :users, :city, :string
    add_column :users, :province, :string
    add_column :users, :avatarUrl, :string
    add_column :users, :language, :string
  end
end
