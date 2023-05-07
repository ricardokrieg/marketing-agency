require 'rails_helper'

RSpec.describe Message, type: :model do
  it "has a valid factory" do
    expect(build(:message)).to be_valid
  end

  describe 'validations' do
    it "requires an account when setting delivered_at" do
      expect(build(:message, delivered_at: Time.zone.now, account: nil)).not_to be_valid
    end
  end

  describe '#delivered?' do
    it "returns true if the message was delivered" do
      expect(build(:message, delivered_at: nil).delivered?).to be_falsey
      expect(build(:message, delivered_at: Time.zone.now).delivered?).to be_truthy
    end
  end
end
