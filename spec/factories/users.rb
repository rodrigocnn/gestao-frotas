FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    role { "admin" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
