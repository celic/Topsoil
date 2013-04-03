class IdeasController < ApplicationController
  def show

    @idea = Idea.find_by_id(@idea.id)

    if @idea.user != current_user
      if @idea.private?
        flash[:error] = "That idea is private. Only its creator can view it."
      else
        render "show"
      end
      render "show"
    end
  end

  def edit
    render "new"
  end

  def new
  	@idea = current_user.ideas.new
  end

  def create
  	if @idea = current_user.ideas.create(params[:idea])
  		render "show"
  	else
  		flash[:error] = "Error saving idea. Check that all forms are complete."
      render "new"
  	end
  end
end
