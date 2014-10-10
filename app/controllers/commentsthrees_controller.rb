class CommentsthreesController < ApplicationController

def create
  @sectionthree = Sectionthree.find(params[:sectionthree_id])
  @commentsthree = Commentsthree.new(comments_content)
  @commentsthree.sectionthree = @sectionthree
  @commentsthree.user = current_user
  if @commentsthree.save
     flash[:success] = "Comment created!"
     redirect_to sectionthrees_showpage_path(:id => @sectionthree.id)
  end
end

private

def comments_content
  params.require(:commentsthree).permit(:commentsthree)
  end
end