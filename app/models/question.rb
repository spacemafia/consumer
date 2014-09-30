class Question < ActiveRecord::Base
	belongs_to :user
	has_many :relationships, foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :relationships, source: :follower
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 1400 }
	validates :user_id, presence: true

end
