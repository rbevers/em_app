FactoryGirl.define do
  sequence :email do |n|
    "bubba+#{n}@testola.com"
  end

  sequence :first_name do |n|
    "Bubba#{n}"
  end

  sequence :last_name do |n|
    "Gump#{n}"
  end

  factory :user do
    email
    password 'abcDEF123ivvvi'
    first_name
    last_name
  end

end
