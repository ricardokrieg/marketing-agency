class Campaign < ApplicationRecord
  validates :title, :content, presence: true
end
