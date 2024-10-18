class ArticlesController < ApplicationController
  # http_basic_authenticate_with name: "user", password: "password", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    set_article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.slug = @article.title.parameterize
    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end 

  def edit
    set_article
  end

  def update  
    set_article
    @article.assign_attributes(article_params)
    @article.slug = @article.title.parameterize if @article.title_changed?

    if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_article
    @article.destroy

    redirect_to root_path, status: :see_other, notice: "Article was successfully deleted."
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status, :slug)
    end

    def set_article
      @article = Article.find_by!(slug: params[:slug])
    end
end
