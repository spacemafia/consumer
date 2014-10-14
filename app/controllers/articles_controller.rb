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
  @questions = Question.find(:all, :limit => 5)
  end

  def show
   @article = Article.find(params[:id])
   @sectionone = Sectionone.new(params[:sectionone_params])
   @sectiontwo = Sectiontwo.new(params[:sectiontwo_params])
   @sectionthree = Sectionthree.new(params[:sectionthree_params])
   @sectionfour = Sectionfour.new(params[:sectionfour_params])
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

  def tagged
  if params[:tag].present? 
    @articles = Article.tagged_with(params[:tag])
  else 
    @articles = Article.all
  end
  end

  private

  def article_params
    params.require(:article).permit(:title, :introduction, :deck, :image, :tag_list, :headingone,
                                      :headingtwo, :headingthree, :headingfour, :bodyone, :bodytwo,
                                      :bodythree, :bodyfour)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end