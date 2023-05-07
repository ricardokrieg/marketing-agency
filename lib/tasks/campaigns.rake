namespace :campaigns do
  desc "Create sample campaigns"
  task create: :environment do
    count = ENV['count'].presence || 1
    puts "Creating #{count} campaigns"
    FactoryBot.create_list(:campaign, count.to_i)
  end
end
