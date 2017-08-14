FactoryGirl.define do
  factory :study do
    study_type 0
    sequence :name { |n| "study name #{n}" }
    status :pending
    sequence :protocol_number { |n| "123456#{n}" }
    creator user
  end
end
