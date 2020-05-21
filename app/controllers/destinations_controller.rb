class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
    
    @recent_posts = @destination.posts.sort { |a,b| a.created_at <=> b.created_at }


    @featured_post = @destination.posts.max {|a, b| a.likes <=> b.likes }

    ages = []
    @destination.bloggers.each do |b|
      ages << b.age
    end

    @average_age = ages.sum / ages.size
    
  end

end
