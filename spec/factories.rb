FactoryBot.define do
  factory(:campaign) do
    title { Faker::Marketing.buzzwords.capitalize }
  end
end