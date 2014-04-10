class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :saver_id
      t.string :zpid
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :latitude
      t.string :longitude
      t.integer :zestimate
      t.integer :valuation_range_high
      t.integer :valuation_range_low
      t.string :use_code
      t.integer :lot_size_square_feet
      t.integer :finished_square_feet
      t.integer :bathrooms
      t.integer :bedrooms
      t.string :tax_assessment_year
      t.integer :tax_assessment
      t.integer :tax_paid
      t.string :year_built
      t.string :last_sold_date
      t.integer :last_sold_price
      t.string :zillow_link
      t.string :zillow_comps
      t.string :zillow_mapz

      t.timestamps
    end
  end
end
