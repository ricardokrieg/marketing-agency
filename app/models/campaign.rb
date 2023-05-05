class Campaign < ApplicationRecord
  validates :title, :content, :targets, presence: true

  def target_list
    targets.split("\n")
  end
end
