class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'コメントを作成しました。'
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = '作成に失敗しました。'
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
