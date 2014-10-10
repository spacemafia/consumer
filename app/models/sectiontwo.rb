class Sectiontwo < ActiveRecord::Base
belongs_to :article
belongs_to :user
has_many :commentstwo
default_scope -> { order('created_at DESC') }
end
