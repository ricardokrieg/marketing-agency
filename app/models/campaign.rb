class Campaign < ApplicationRecord
  has_many :messages, inverse_of: :campaign

  validates :title, :content, :targets, presence: true

  def target_list
    targets.split("\n")
  end
end
