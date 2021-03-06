FactoryBot.define do
  factory :workout do
    name { "Cardio" }
  end

  factory :user do
    email { 'test@example.com' }
    password { 'f4k3p455w0rd' }
    # using dynamic attributes over static attributes in FactoryBot

    # if needed
    # is_active true
  end

  factory :activity do
    association :user
    name { 'benchpress'}
  end
end
