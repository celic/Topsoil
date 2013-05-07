class PagesController < ApplicationController

  def home
  end

  def search
  	@ideas = Idea.search(params[:search]).page(params[:page]).per_page(20)
  end
end
