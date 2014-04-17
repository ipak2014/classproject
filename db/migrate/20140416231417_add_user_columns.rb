class AddUserColumns < ActiveRecord::Migration
  def change
	add_column :users, :ssn, :integer
	add_column :users, :dob, :string
	add_column :users, :phone, :integer
	add_column :users, :marital_status, :string
	add_column :users, :degree, :string
	add_column :users, :street, :string
	add_column :users, :city, :string
	add_column :users, :state, :string
	add_column :users, :zipcode, :string
	add_column :users, :res_years, :integer
	add_column :users, :ownrent, :string
	add_column :users, :w2, :string
	add_column :users, :current1040, :string
	add_column :users, :prior1040, :string
  end
end
