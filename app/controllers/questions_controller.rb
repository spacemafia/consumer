class QuestionsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def index
  @questions = Question.paginate(page: params[:page])
  @question = current_user.questions.build if current_user
  @user = @question.user if current_user
  end

  def show
   @user = User.find(params[:email])
   @question = Question.find(params[:id])
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "Question created!"
      redirect_to root_url
    else
    render 'static_pages/home'
    end
  end

  def destroy
    @question.destroy
    redirect_to root_url
  end

  def following
    @title = "Following"
    @question = Question.find(params[:id])
    @users = @question.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def question_params
      params.require(:question).permit(:content)
    end

    def correct_user
      @question = current_user.questions.find_by(id: params[:id])
      redirect_to root_url if @question.nil?
    end
end