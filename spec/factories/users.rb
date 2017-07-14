FactoryGirl.define do
  factory :user do
    sequence :login { |n| "12345#{n}" }
    password "password"
  end
end
