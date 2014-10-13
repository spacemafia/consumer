class Commentsthree < ActiveRecord::Base
belongs_to :user
belongs_to :sectionthree
belongs_to :article
validates :commentsthree, presence: true
validates :user_id, presence: true
validates :sectionthree_id, presence: true
end
