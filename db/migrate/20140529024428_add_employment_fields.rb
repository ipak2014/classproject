class AddEmploymentFields < ActiveRecord::Migration
  def change
  	add_column :users, :company1, :string
  	add_column :users, :position1, :string
  	add_column :users, :length1, :string
  	add_column :users, :company2, :string
  	add_column :users, :position2, :string
  	add_column :users, :length2, :string
  	add_column :users, :company3, :string
  	add_column :users, :position3, :string
  	add_column :users, :length3, :string
  end
end
