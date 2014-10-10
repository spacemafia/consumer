class SectiononesController < ApplicationController
    
  def index
  @sectionones = Sectionone.all
  @sectionone = current_user.sectionones.build if admin_user
  @user = @sectionone.user if admin_user
  end

  def show
   @sectionone = Sectionone.find(params[:id])
   @sectionones = Sectionone.all
   @commentsone = Commentsone.new(params[:comments_content])
   end

  def create
    @sectionone = current_user.sectionones.build(sectionone_params)
    if @sectionone.save
      flash[:success] = "Section created!"
      redirect_to root_url
    else
    redirect_to articles_path
    end
  end

  def destroy
   @sectionone = Sectionone.find(params[:id])
    if @sectionone.present?
      @sectionone.destroy
    else
    redirect_to articles_path
    end
  end

  private

  def sectionone_params
    params.require(:sectionone).permit(:headingone, :contentone)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end