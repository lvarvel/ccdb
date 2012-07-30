class Investor < ActiveRecord::Base
  has_many :investments

  attr_accessible :tax_id
end
