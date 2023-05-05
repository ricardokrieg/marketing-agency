FactoryBot.define do
  factory(:campaign) do
    title { Faker::Marketing.buzzwords.capitalize }
    content { Faker::Lorem.paragraph(sentence_count: 10, random_sentences_to_add: 10) }
    targets { Faker::Internet.username(specifier: 10..15) }
  end
end
