# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :investment do
    amount "9.99"
    investor_id 1
    deal_id 1
  end
end
