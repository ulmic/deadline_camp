# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    email
    password             { generate :string }
    first_name           { generate :name }
    middle_name          { generate :name }
    last_name            { generate :name }
    phone
    city                 { generate :string }
    birthday             { -16.year.from_now }
    reason               { generate :string }
    question             { generate :string }
    how_long_programming { generate :string }
    what_you_want        { generate :string }
    what_you_tried       { generate :string }

    trait :with_auth_token do
      auth_token { generate :name }
    end

    trait :with_full_profile do
      skype             { generate :string }
      camp_time         true
      camp_life         true
      camp_fee          true
      camp_notebook     true
      how_hear_about_as { generate :string }
      vkontakte         { generate :uri }
      facebook          { generate :uri }
      twitter           { generate :uri }

      after(:create) do |instance|
        with_options member: instance do |m|
          m.create 'member/additional_education'
          m.create 'member/achievement'
          m.create 'member/lang'
          m.create 'member/skill_program_lang'
          m.create 'member/skill_ide'
          m.create 'member/job'
          m.create 'member/skill_database'
          m.create 'member/skill_os'
          m.create 'member/skill_other'
          m.create 'member/other'
          m.create 'member/preference'
        end
      end
    end
  end
end
