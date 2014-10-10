class Commentsthree < ActiveRecord::Base
belongs_to :user
belongs_to :sectionthree
validates :commentsthree, presence: true
validates :user_id, presence: true
validates :sectionthree_id, presence: true
end
