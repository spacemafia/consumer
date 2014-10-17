class StaticPagesController < ApplicationController
  def home
    @question = current_user.questions.build if signed_in?
    @user = current_user
    @questions = Question.all
  end

  def about
  end

  def help
  end
end