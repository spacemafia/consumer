class ArticlesController < ApplicationController
    
  def new
  @articles = Article.all
  @article = current_user.articles.build(article_params) if admin_user
  @user = @article.user if admin_user
  end

  def index
  @articles = Article.all
  @article = current_user.articles.build
  @user = @article.user if current_user
  end

  def show
   @article = Article.find(params[:id])
   @sectionone = Sectionone.find(params[:id])
   @sectiontwo = Sectiontwo.find(params[:id])
   @sectionthree = Sectionthree.find(params[:id])
   @sectionfour = Sectionfour.find(params[:id])
   @articles = Article.all
   @commentsfour = Commentsfour.new(params[:comments_content])
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

  def tagged
  if params[:tag].present? 
    @articles = Article.tagged_with(params[:tag])
  else 
    @articles = Article.all
  end
  end

  private

  def article_params
    params.require(:article).permit(:title, :introduction, :deck, :image, :tag_list)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end