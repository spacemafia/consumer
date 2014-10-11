class QuestionsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  
  def index
  @questions = Question.paginate(page: params[:page])
  @question = current_user.questions.build if current_user
  @user = @question.user if current_user
  end

  def show
   @user = User.find(params[:email])
   @question = Question.find(params[:id])
   @questions = Question.all
   @answer = Answer.new(params[:answer_content])
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "Question created!"
      redirect_to root_url
    else
    render 'shared/questions_form'
    end
  end

  def destroy
   @question = Question.find(params[:id])
    if @question.present?
      @question.destroy
    end
    redirect_to questions_path
   end

  def tagged
  if params[:tag].present? 
    @questions = Question.tagged_with(params[:tag])
  else 
    @questions = Question.all
  end
  end

  private

  def question_params
      params.require(:question).permit(:content, :tag_list)
  end

end