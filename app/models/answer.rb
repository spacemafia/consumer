class Answer < ActiveRecord::Base
belongs_to :user
belongs_to :question
validates :answer_content, presence: true
validates :user_id, presence: true
validates :question_id, presence: true

end
