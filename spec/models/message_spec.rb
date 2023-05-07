require 'rails_helper'

RSpec.describe Message, type: :model do
  it "has a valid factory" do
    expect(build(:message)).to be_valid
  end

  describe '#delivered?' do
    it "returns true if the message was delivered" do
      expect(build(:message, delivered_at: nil).delivered?).to be_falsey
      expect(build(:message, delivered_at: Time.zone.now).delivered?).to be_truthy
    end
  end
end
