class Sectionfour < ActiveRecord::Base
belongs_to :article
belongs_to :user
has_many :commentsfour
default_scope -> { order('created_at DESC') }
end
