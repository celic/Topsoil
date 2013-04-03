class IdeasController < ApplicationController
  def show
    if @idea.user_id != current_user.id
      if @idea.private?
        flash[:error] = "That idea is private. Only its creator can view it."
      else
        render "show"
      end
      render "show"
    end
  end

  def edit
  end

  def new
  	@idea = Idea.new
  end

  def create
  	if @idea = Idea.create(params[:idea])
  		#success
  	else
  		flash[:error] = "Error saving idea. Check that all forms are complete."
  	end
  end
end
