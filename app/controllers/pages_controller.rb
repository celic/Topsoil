class PagesController < ApplicationController

  def home
  end

  def search
  	@ideas = Idea.search(params[:search], params[:page]).page(params[:page]).per_page(20)
  end
end
