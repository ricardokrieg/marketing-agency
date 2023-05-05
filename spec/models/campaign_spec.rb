require 'rails_helper'

describe Campaign do
  it "has a valid factory" do
    expect(build(:campaign)).to be_valid
  end
end