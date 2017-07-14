FactoryGirl.define do
  factory :role do
    sequence :title { |n| "title#{n}" }
  end
end
