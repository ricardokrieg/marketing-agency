FactoryBot.define do
  factory :profile do
    instagram_id { Faker::Number.number(digits: 10) }
    username { Faker::Internet.username(specifier: 10..15) }
  end

  factory(:campaign) do
    title { Faker::Marketing.buzzwords.capitalize }
    content { Faker::Lorem.paragraph(sentence_count: 10, random_sentences_to_add: 10) }
    targets { Faker::Internet.username(specifier: 10..15) }

    trait :with_multiple_targets do
      targets do
        5.times.inject([]) { |ary| ary << Faker::Internet.username(specifier: 10..15) }.join("\n")
      end
    end
  end
end
