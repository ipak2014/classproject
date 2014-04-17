class ChangeDataTypes < ActiveRecord::Migration
  def change
  change_column :users, :res_years, :float
  change_column :users, :ssn, :string
  change_column :users, :phone, :string
  end
end
