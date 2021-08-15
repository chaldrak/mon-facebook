class PostsController < ApplicationController

  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :get_all_post, only: %i[ index confirm ]

  def index
    @post = Post.new
  end

  def show
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render "posts/index" if @post.invalid?
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render "index"
    else
      if @post.save
        redirect_to user_path(current_user.id)
        flash[:success] = "Publication envoyée"
      else
        render :index
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def get_all_post
      @posts = Post.all.order(created_at: :desc)
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:image, :image_cache, :content)
    end
end
