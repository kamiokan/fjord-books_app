# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :icon
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :icon_content_type, if: :was_attached?

  def icon_content_type
    extension = ['image/png', 'image/jpg', 'image/jpeg', 'image/gif']
    errors.add(:icon, 'の拡張子が間違っています') unless icon.content_type.in?(extension)
  end

  def was_attached?
    icon.attached?
  end
end
