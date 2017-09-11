class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :street
      t.string :city
      t.integer :zip
      t.string :state
      t.integer :beds
      t.integer :baths
      t.integer :sq_ft
      t.string :property_type
      t.datetime :sale_date
      t.integer :price
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
