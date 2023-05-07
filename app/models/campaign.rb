class Campaign < ApplicationRecord
  include AASM

  has_many :messages, inverse_of: :campaign

  validates :title, :content, :targets, presence: true

  aasm column: :state do
    state :draft, initial: true
    state :processing, :completed

    event :process do
      transitions from: :draft, to: :processing
    end

    event :complete do
      transitions from: :processing, to: :completed
    end
  end

  def target_list
    targets.split("\n")
  end
end
