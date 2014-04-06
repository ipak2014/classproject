class CreateServiceareas < ActiveRecord::Migration
  def change
    create_table :serviceareas do |t|
      t.integer :zip

      t.timestamps
    end
  end
end
