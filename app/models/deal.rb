class Deal < ActiveRecord::Base
  belongs_to :issuer
  has_many :investments

  attr_accessible :issuer_id
end
