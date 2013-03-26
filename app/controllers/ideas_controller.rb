class IdeasController < ApplicationController
  def show
  end

  def edit
  end

  def new
  	@idea = Idea.new
  end

  def create
  	if @idea = Idea.create(params[:idea])
  	  flash[:success] = "Idea successfully created."
      redirect_to ideas(@idea)_show_path 
  	else
  	  flash[:error] = "Error saving idea. Check that all forms are complete."
  	end
  end
end
