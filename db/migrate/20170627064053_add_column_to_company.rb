class AddColumnToCompany < ActiveRecord::Migration[5.1]
  def change
  	add_column :companies, :cname, :string
  	add_column :companies, :regno, :string
  	add_column :companies, :startdate, :date
  	add_column :companies, :enddate, :date
  	add_column :companies, :cdescription, :text
  end
end
