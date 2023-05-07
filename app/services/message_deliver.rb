class MessageDeliver
  def deliver(message, account)
    prepare_account(account)
    send_message(message, account)
  end

  private

  def prepare_account(account)
  end

  def send_message(message, account)
  end
end