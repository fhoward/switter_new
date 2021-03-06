class Swit < ApplicationRecord
  belongs_to :user
  acts_as_votable
  acts_as_taggable_on :tags
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 } #140 char limit
  default_scope -> { order(created_at: :desc) } #newest to oldest
  has_many :comment
end
