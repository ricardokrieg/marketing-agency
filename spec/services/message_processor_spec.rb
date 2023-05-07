require 'rails_helper'

describe MessageProcessor do
  let(:message) { create(:message) }
  let(:processor) { MessageProcessor.new(message) }
  let(:account) { create(:account) }
  let(:deliver) { double(:deliver) }

  before do
    allow(deliver).to receive(:deliver)
  end

  it "sets a message as delivered" do
    expect {
      processor.deliver_with(account, deliver)
    }.to change(message, :delivered?).from(false).to true
  end

  it "sets account to message" do
    expect {
      processor.deliver_with(account, deliver)
    }.to change(message, :account).from(nil).to account
  end

  it "calls the message deliver" do
    expect(deliver).to receive(:deliver).with(message, account)

    processor.deliver_with(account, deliver)
  end

  context "the delivery fails" do
    before do
      allow(deliver).to receive(:deliver).and_raise
    end

    it "notifies the error" do
      allow(ErrorMonitor).to receive(:notify)
      expect(ErrorMonitor).to receive(:notify)

      processor.deliver_with(account, deliver)
    end

    it "does not update the message" do
      expect(message.delivered?).to be_falsey

      processor.deliver_with(account, deliver)

      expect(message.delivered?).to be_falsey
    end
  end
end