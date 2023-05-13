namespace :proxy do
  desc "Check IP location for a given proxy"
  task check: :environment do
    require 'proxy_checker'

    puts ProxyChecker.new(ipify_token: Rails.application.credentials.ipify.token).check(ENV['proxy'])
  end
end
