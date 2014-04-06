class CreateSavers < ActiveRecord::Migration
  def change
    create_table :savers do |t|
      t.integer :income
      t.string :cc
      t.integer :retirement
      t.integer :savings
      t.integer :mortgage
      t.integer :downpayment
      t.string :ready
      t.integer :zip
      t.string :email

      t.timestamps
    end
  end
end
