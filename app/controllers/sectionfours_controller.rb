class SectionfoursController < ApplicationController
  before_action :admin_user
    
  def index
  @sectionfours = Sectionfour.all
  @sectionfour = current_user.sectionfours.build if admin_user
  @user = @sectionfour.user if admin_user
  end

  def show
   @sectionfour = Sectionfour.find(params[:id])
   @sectionfours = Sectionfour.all
   @commentsfour = Commentsfour.new(params[:comments_content])
   end

  def create
    @sectionfour = current_user.sectionfours.build(sectionfour_params)
    if @sectionfour.save
      flash[:success] = "Section Four created!"
      redirect_to root_url
    else
    redirect_to articles_path
    end
  end

  def destroy
   @sectionfour = Sectionfour.find(params[:id])
    if @sectionfour.present?
      @sectionfour.destroy
    else
    redirect_to articles_path
    end
  end

  private

  def sectionfour_params
    params.require(:sectionfour).permit(:headingfour, :contentfour)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end