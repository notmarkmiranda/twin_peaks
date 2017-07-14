FactoryGirl.define do
  factory :user do
    sequence :user_id { |n| "12345#{n}" }
    password "password"
  end
end
