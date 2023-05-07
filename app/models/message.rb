class Message < ApplicationRecord
  belongs_to :campaign, inverse_of: :messages
  belongs_to :profile

  validates :content, presence: true

  def delivered?
    delivered_at.present? && delivered_at <= Time.zone.now
  end
end
