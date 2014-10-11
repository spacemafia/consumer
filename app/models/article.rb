class Article < ActiveRecord::Base
belongs_to :user
has_one :sectionone
has_one :sectiontwo
has_one :sectionthree
has_one :sectionfour
has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
default_scope -> { order('created_at DESC') }
validates :user_id, presence: true
validates :title, presence: true
acts_as_taggable_on :tags
end