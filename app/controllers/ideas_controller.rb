class IdeasController < ApplicationController
  
  def show
    @idea = Idea.find_by_id(params[:idea])
  end

  def edit
  end

  def new
  	@idea = Idea.new
  end

  def create
  	if @idea = Idea.create(params[:idea])
  	  flash[:success] = "Idea successfully created."
      redirect_to idea_path(@idea) 
  	else
  	  flash[:error] = "Error saving idea. Check that all forms are complete."
  	end
  end
end
