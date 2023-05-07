class MessageProcessor
  def initialize(message)
    @message = message
  end

  def deliver_with(account)
    @message.update!(
      delivered_at: Time.zone.now,
      account: account
    )
  end
end