class CommentsController < ApplicationController
	 http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

	def create
  		#render plain: comment_params.inspect
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		#:commenter => comment_params[:commenter], :body => comment_params[:body], :foreign_key => :article_id)
		redirect_to article_path(@article)
	end

	 def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

	private
	def comment_params
		params.require(:comment).permit(:commenter,:body)
	end
end
