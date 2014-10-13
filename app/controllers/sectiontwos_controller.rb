class SectiontwosController < ApplicationController
  before_action :admin_user
    
  def index
  @sectiontwos = Sectiontwo.all
  @sectiontwo = current_user.sectiontwos.build
  @user = @sectiontwo.user
  end

  def show
   @sectiontwo = Sectiontwo.find(params[:id])
   @sectiontwos = Sectiontwo.all
   @commentstwo = Commentstwo.new(params[:comments_content])
   end

  def create
    @sectiontwo = current_user.sectiontwos.build(sectiontwo_params)
    if @sectiontwo.save
      flash[:success] = "Section Two created!"
      redirect_to root_url
    else
    redirect_to articles_path
    end
  end

  def destroy
   @sectiontwo = Sectiontwo.find(params[:id])
    if @sectiontwo.present?
      @sectiontwo.destroy
    else
    redirect_to articles_path
    end
  end

  private

  def sectiontwo_params
    params.require(:sectiontwo).permit(:headingtwo, :contenttwo)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end