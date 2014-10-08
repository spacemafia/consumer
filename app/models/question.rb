class Question < ActiveRecord::Base
	belongs_to :user
	has_many :relationships, foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :relationships, source: :follower
  has_many :answers
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 1400 }
	validates :user_id, presence: true
	extend FriendlyId
	acts_as_taggable_on :tags
	friendly_id :content, use: :slugged
end