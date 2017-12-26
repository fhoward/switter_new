class Swit < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 } #140 char limit
  default_scope -> { order(created_at: :desc) } #newest to oldest
end
