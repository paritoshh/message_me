class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  scope :custom_last_few, -> {order(created_at: :desc).limit(17)}
end
