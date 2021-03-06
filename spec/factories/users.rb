FactoryGirl.define do
  factory :user do
    sequence :login { |n| "12345#{n}" }
    password 'password'
    active true
    roles [ 'primary_investigator']

    factory :admin do
      after(:create) do |user|
        user.roles = [:admin]
      end
    end

    factory :coordinator do
      after(:create) do |user|
        user.roles = [:coordinator]
      end
    end
  end
end
