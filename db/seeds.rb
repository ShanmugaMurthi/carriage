# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Sacramentorealestatetransactions.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  Property.create(street: row['street'], city: row['city'], zip: row['zip'], state: row['state'], beds: row['beds'], sq_ft: row['sq_ft'], property_type: row['type'], sale_date: row['sale_date'], price: row['price'], latitude: row['latitude'], longitude: row['longitude'])
end
