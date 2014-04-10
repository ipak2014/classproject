class Property < ActiveRecord::Migration
  def change
  	add_column :properties, :cityzip, :text
  end
end
