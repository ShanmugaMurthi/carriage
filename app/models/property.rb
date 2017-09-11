class Property < ApplicationRecord
  validates_presence_of :street, :city
  include Filterable
  scope :property_type, -> (property_type) { where property_type: property_type }
  scope :sq_ft, -> (sq_ft) { where sq_ft: (sq_ft[0]..sq_ft[1]) }
  scope :price, -> (price) { where price: (price[0]..price[1]) }
end
