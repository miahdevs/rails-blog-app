class CommentsController < ApplicationController
  # http_basic_authenticate_with name: "user", password: "password", only: :destroy

  def create
    @article = Article.find_by!(slug: params[:article_slug])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find_by!(slug: params[:article_slug])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
