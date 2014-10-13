class Commentstwo < ActiveRecord::Base
belongs_to :user
belongs_to :sectiontwo
belongs_to :article
validates :commentstwo, presence: true
validates :user_id, presence: true
validates :sectiontwo_id, presence: true
end
