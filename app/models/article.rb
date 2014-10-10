class Article < ActiveRecord::Base
belongs_to :user
has_one :sectionone
has_one :sectiontwo
default_scope -> { order('created_at DESC') }
validates :user_id, presence: true
validates :title, presence: true
end