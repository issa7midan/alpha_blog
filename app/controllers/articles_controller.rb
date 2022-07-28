class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except:[:index, :show]
  before_action :require_same_user, only: [:update, :destroy, :edit]
  def show

  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 6)
  end

  def new
    @article = Article.new
  end

  def edit

  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.save
    if @article.save
      flash[:notice] = 'Article was created Succesfuly'
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was updated succesfuly!'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
   params.require(:article).permit(:title, :description)
  end

  def require_same_user && !current_user.admin?
    if current_user != @article.user
      flash[:alert] = 'You can only edit or delete your articles'
      redirect_to @article
    end
  end
end
