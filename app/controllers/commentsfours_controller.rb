class CommentsfoursController < ApplicationController

def create
  @sectionfour = Sectionfour.find(params[:sectionfour_id])
  @commentsfour = Commentsfour.new(comments_content)
  @commentsfour.sectionfour = @sectionfour
  @commentsfour.user = current_user
  if @commentsfour.save
     flash[:success] = "Comment created!"
     redirect_to article_path(:id => @sectionfour.id)
  end
end

private

def comments_content
  params.require(:commentsfour).permit(:commentsfour)
  end
end