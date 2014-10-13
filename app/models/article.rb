class Article < ActiveRecord::Base
belongs_to :user
has_one :sectionone
has_many :commentsone
has_one :sectiontwo
has_many :commentstwo
has_one :sectionthree
has_many :commentsthree
has_one :sectionfour
has_many :commentsfour
has_many :questions
belongs_to :questions
has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
default_scope -> { order('created_at DESC') }
validates :user_id, presence: true
validates :title, presence: true
acts_as_taggable_on :tags
end