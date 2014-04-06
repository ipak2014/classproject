lass CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.integer :income
      t.text :cc
      t.integer :retirement
      t.integer :savings
      t.integer :mortgage
      t.integer :downpayment
      t.text :ready
      t.integer :zip

      t.timestamps
    end
  end
end
