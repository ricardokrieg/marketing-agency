require 'rails_helper'

describe MessageProcessor do
  let(:message) { create(:message) }
  let(:processor) { MessageProcessor.new(message) }
  let_it_be(:account) { create(:account) }

  it "sets a message as delivered" do
    expect {
      processor.deliver_with(account)
    }.to change(message, :delivered?).from(false).to true
  end

  it "sets account to message" do
    expect {
      processor.deliver_with(account)
    }.to change(message, :account).from(nil).to account
  end
end