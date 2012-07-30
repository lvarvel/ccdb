class Investment < ActiveRecord::Base
  belongs_to :deal
  belongs_to :investor

  attr_accessible :amount, :deal_id, :investor_id
end
