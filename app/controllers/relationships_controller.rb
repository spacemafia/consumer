class RelationshipsController < ApplicationController
  before_action :signed_in_user

  def create
    @question = Question.find(params[:relationship][:followed_id])
    current_user.follow_question!(@question)
    redirect_to root_path
  end

  def destroy
    @question = Relationship.find(params[:id]).followed
    current_user.question_unfollow!(@question)
    redirect_to root_path
    end
end