require 'rails_helper'

describe Campaign do
  it "has a valid factory" do
    expect(build(:campaign)).to be_valid
  end

  describe '#target_list' do
    let_it_be(:campaign) { build(:campaign, targets: "target1\ntarget2") }

    it "returns targets as an array" do
      expect(campaign.target_list).to eq(%w(target1 target2))
    end
  end

  describe 'state' do
    it "defaults to 'draft'" do
      expect(build(:campaign).state).to eq('draft')
    end

    it "transitions to from 'draft' to 'processing'" do
      campaign = create(:campaign)

      expect {
        campaign.process
      }.to change(campaign, :state).from('draft').to 'processing'
    end

    it "transitions to from 'processing' to 'completed'" do
      campaign = create(:campaign, state: 'processing')

      expect {
        campaign.complete
      }.to change(campaign, :state).from('processing').to 'completed'
    end

    it "raises an error when trying an invalid transition" do
      campaign = create(:campaign)

      expect {
        campaign.complete
      }.to raise_exception(AASM::InvalidTransition)
    end
  end
end