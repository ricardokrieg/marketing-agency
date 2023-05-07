class Message < ApplicationRecord
  belongs_to :campaign, inverse_of: :messages
  belongs_to :profile

  validates :content, presence: true
end
