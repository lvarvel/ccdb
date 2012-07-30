class Investment < ActiveRecord::Base
  attr_accessible :amount, :deal_id, :investor_id
end
