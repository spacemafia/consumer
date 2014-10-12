class Commentsfour < ActiveRecord::Base
belongs_to :user
belongs_to :sectionfour
belongs_to :article
default_scope -> { order('created_at DESC') }
validates :commentsfour, presence: true
validates :user_id, presence: true
validates :sectionfour_id, presence: true
end
