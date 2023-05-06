class Profile < ApplicationRecord
  validate :instagram_id_or_username

  private

  def instagram_id_or_username
    return if instagram_id.present? || username.present?

    errors.add(:base, 'must provide instagram_id and/or username')
  end
end
