class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    find_post
  end

  def edit
    find_post
  end

  def update
    find_post

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    find_post

    @post.destroy

    redirect_to root_url
  end

  private
    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      {title: params[:post][:title], content: params[:post][:content], user: current_user}
    end

end
