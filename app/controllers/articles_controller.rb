class ArticlesController < ApplicationController
    
  def index
  @articles = Article.all
  @article = current_user.articles.build if admin_user
  @user = @article.user if admin_user
  end

  def show
   @article = Article.find(params[:id])
   @sectionone = Sectionone.find(params[:id])
   @sectiontwo = Sectiontwo.find(params[:id])
   @articles = Article.all
   end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "Article created!"
      redirect_to root_url
    else
    redirect_to articles_path
    end
  end

  def destroy
   @article = Article.find(params[:id])
    if @article.present?
      @article.destroy
    else
    redirect_to articles_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :introduction, :deck, :subheadingone,
                                      :contentone, :subheadingtwo, :contenttwo, 
                                      :subheadingthree, :contentthree, :subheadingfour,
                                      :contentfour)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end