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
end