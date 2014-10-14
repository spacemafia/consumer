class Sectiontwo < ActiveRecord::Base
belongs_to :article
belongs_to :user
default_scope -> { order('created_at DESC') }
validates :contenttwo, presence: true
acts_as_votable
end
