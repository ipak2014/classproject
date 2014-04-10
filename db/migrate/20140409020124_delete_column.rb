class DeleteColumn < ActiveRecord::Migration
  def delete_column
  remove_column :users, :password, :string 
  end
end
