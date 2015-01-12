FactoryGirl.define do
  factory :contact do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) {|n| "user_#{n}@example.com" }
    title { Faker::Name.title }
  end

end
