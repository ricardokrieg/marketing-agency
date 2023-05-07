class MessageProcessor
  def initialize(message)
    @message = message
  end

  def deliver_with(account, deliver)
    deliver.deliver(@message, account)

    @message.update!(
      delivered_at: Time.zone.now,
      account: account
    )
  rescue => e
    ErrorMonitor.notify(e)
  end
end
