FactoryGirl.define do
  factory :study do
    type 0
    sequence :name { |n| "study name #{n}" }
    status 0
    sequence :protocol_number { |n| "123456#{n}" }
    creator
  end
end
