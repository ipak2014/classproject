class AddColumnsToUsers < ActiveRecord::Migration
  def change
  add_column :users, :judgment, :string
  add_column :users, :bankruptcy, :string
  add_column :users, :foreclosure, :string
  add_column :users, :lawsuit, :string
  add_column :users, :obligation, :string
  add_column :users, :delinquency, :string
  add_column :users, :alimony, :string
  add_column :users, :downpayment_borrowed, :string
  add_column :users, :endorsement, :string
  add_column :users, :citizen, :string
  add_column :users, :resident, :string
  add_column :users, :residency, :string

  end
end
