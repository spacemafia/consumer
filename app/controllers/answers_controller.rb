class AnswersController < ApplicationController

def create
  @question = Question.find(params[:question_id])
  @answer = Answer.new(answer_content)
  @answer.question = @question
  @answer.user = current_user
  if @answer.save
     flash[:success] = "Answer created!"
     redirect_to user_question_path(:email => @question.user.id, :id => @question.id)
  end
end

private

def answer_content
  params.require(:answer).permit(:answer_content)
  end
end