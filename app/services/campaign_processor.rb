class CampaignProcessor
  def initialize(campaign)
    @campaign = campaign
  end

  def process
    @campaign.process!

    @campaign.target_list.each do |target|
      profile = Profile.find_or_create_by!(username: target)
      @campaign.messages.create!(profile: profile, content: @campaign.content)
    end
  end
end