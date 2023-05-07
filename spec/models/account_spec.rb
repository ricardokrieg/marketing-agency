require 'rails_helper'

RSpec.describe Account, type: :model do
  it "has a valid factory" do
    expect(build(:account)).to be_valid
  end
end
