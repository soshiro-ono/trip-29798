FactoryBot.define do
  factory :spot do
    title              {"KOBE"}
    description        {"とても大きいです"}
    city_id            {2}
    genre_id           {2}
    location_id        {2}

    association :user

    after(:build) do |spot|
      spot.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end