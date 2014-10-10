class Sectionthree < ActiveRecord::Base
belongs_to :article
belongs_to :user
has_many :commentsthree
default_scope -> { order('created_at DESC') }
end
