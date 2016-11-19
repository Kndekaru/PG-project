class CommentsController < ApplicationController

  def new
    find_comment
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    redirect_to post_path(@post)
  end

  def edit
    find_comment
    find_post
  end

  def update
    find_post
    find_comment

    if @comment.update(comment_params)
    # @comment.update_attributes(comment_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    find_post
    find_comment

    @comment.destroy

    redirect_to @post
  end

  private
    def find_post
      @post = Post.find(params[:post_id])
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      {reply: params[:comment][:reply], user: current_user, post: @post}
    end

end
