class Sectionone < ActiveRecord::Base
belongs_to :article
belongs_to :user
has_many :commentsone
end
