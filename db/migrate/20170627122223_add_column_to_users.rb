class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :uname, :string
  	add_column :users, :phone_no, :string
  	add_column :users, :date_of_birth, :date
  	add_column :users, :user_type, :string
  end
end
