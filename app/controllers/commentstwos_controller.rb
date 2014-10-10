class CommentstwosController < ApplicationController

def create
  @sectiontwo = Sectiontwo.find(params[:sectiontwo_id])
  @commentstwo = Commentstwo.new(comments_content)
  @commentstwo.sectiontwo = @sectiontwo
  @commentstwo.user = current_user
  if @commentstwo.save
     flash[:success] = "Comment created!"
     redirect_to sectiontwos_showpage_path(:id => @sectiontwo.id)
  end
end

private

def comments_content
  params.require(:commentstwo).permit(:commentstwo)
  end
end