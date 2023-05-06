require 'rails_helper'

RSpec.describe Profile, type: :model do
  it "has a valid factory" do
    expect(build(:profile)).to be_valid
  end

  it "requires either username or instagram_id" do
    expect(build(:profile, instagram_id: nil, username: nil)).not_to be_valid
    expect(build(:profile, instagram_id: nil)).to be_valid
    expect(build(:profile, username: nil)).to be_valid
  end
end
