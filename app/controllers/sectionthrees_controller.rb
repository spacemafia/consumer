class SectionthreesController < ApplicationController
    
  def index
  @sectionthrees = Sectionthree.all
  @sectionthree = current_user.sectionthrees.build if admin_user
  @user = @sectionthree.user if admin_user
  end

  def show
   @sectionthree = Sectionthree.find(params[:id])
   @sectionthrees = Sectionthree.all
   @commentsthree = Commentsthree.new(params[:comments_content])
   end

  def create
    @sectionthree = current_user.sectionthrees.build(sectionthree_params)
    if @sectionthree.save
      flash[:success] = "Section Three created!"
      redirect_to root_url
    else
    redirect_to articles_path
    end
  end

  def destroy
   @sectionthree = Sectionthree.find(params[:id])
    if @sectionthree.present?
      @sectionthree.destroy
    else
    redirect_to articles_path
    end
  end

  private

  def sectionthree_params
    params.require(:sectionthree).permit(:headingthree, :contentthree)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end