class Message < ApplicationRecord
  belongs_to :campaign, inverse_of: :messages
  belongs_to :profile
  belongs_to :account, optional: true

  validates :content, presence: true
  validates :account, presence: true, if: :delivered?

  def delivered?
    delivered_at.present? && delivered_at <= Time.zone.now
  end
end
