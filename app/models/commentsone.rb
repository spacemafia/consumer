class Commentsone < ActiveRecord::Base
belongs_to :user
belongs_to :sectionone
validates :commentsone, presence: true
validates :user_id, presence: true
validates :sectionone_id, presence: true
end
