class Commentsfour < ActiveRecord::Base
belongs_to :user
belongs_to :sectionfour
validates :commentsfour, presence: true
validates :user_id, presence: true
validates :sectionfour_id, presence: true
end
