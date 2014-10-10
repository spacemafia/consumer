class CommentsonesController < ApplicationController

def create
  @sectionone = Sectionone.find(params[:sectionone_id])
  @commentsone = Commentsone.new(comments_content)
  @commentsone.sectionone = @sectionone
  @commentsone.user = current_user
  if @commentsone.save
     flash[:success] = "Comment created!"
     redirect_to sectionones_showpage_path(:id => @sectionone.id)
  end
end

private

def comments_content
  params.require(:commentsone).permit(:commentsone)
  end
end