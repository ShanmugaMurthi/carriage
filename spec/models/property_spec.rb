require 'rails_helper'

RSpec.describe Property, type: :model do  
  it { should validate_presence_of(:street) }
  it { should validate_presence_of(:city) }
end
