class BloggersController < ApplicationController
  
  
  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = Blogger.find(params[:id])
    @likes = @blogger.posts.map do |p|
                p.likes
              end.sum
    @feature_post = @blogger.posts.max {|a, b| a.likes <=> b.likes }
    
  end

  def new
    @blogger = Blogger.new
  end

  def create
    blogger = Blogger.new(blogger_params)
    if blogger.valid?
      blogger.save
      redirect_to blogger
    else
      flash[:errors] = blogger.errors.full_messages #key can be anything
      redirect_to "/bloggers/new" #new_employee_path
    end

  end


  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end


end
