require 'rails_helper'

describe CampaignProcessor do
  let_it_be(:campaign) { create(:campaign, targets: "target1\ntarget2") }
  let_it_be(:processor) { CampaignProcessor.new(campaign) }

  it "creates profiles from the targets" do
    expect {
      processor.process
    }.to change(Profile, :count).by(2)
  end

  it "does not create duplicated profiles" do
    create(:profile, username: 'target1')

    expect {
      processor.process
    }.to change(Profile, :count).by(1)
  end

  it "creates messages for each target" do
    create(:profile, username: 'target1')

    expect {
      processor.process
    }.to change(Message, :count).by(2)
  end
end