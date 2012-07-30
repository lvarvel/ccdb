class Issuer < ActiveRecord::Base

  has_many :deals

  attr_accessible :tax_id
end
