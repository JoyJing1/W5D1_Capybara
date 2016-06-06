FactoryGirl.define do
  factory :user do
    username Faker::StarWars.character
    password "password123"


    
  end
end
