class PostsController < ApplicationController
  
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    # @likes = @post.posts.map do |p|
    #             p.likes
    #           end.sum
    # @feature_post = @post.posts.max {|a, b| a.likes <=> b.likes }
    
  end

  def new
    @post = Post.new
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def create
    post = Post.new(post_params)
    if post.valid?
      post.save
      redirect_to post
    else
      flash[:errors] = post.errors.full_messages #key can be anything
      redirect_to "/posts/new" #new_employee_path
    end

  end

  def edit
  end

  def update
  end

  def post_params
      params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
  end


end
