class IdeasController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  def show
    @idea = Idea.find_by_id(@idea.id)

    if @idea.public?
      render "show"
    else
      if !signed_in?
        flash[:error] = "That idea is private. Please sign in to view the idea if you created it."
      elsif @idea.user != current_user
        render "show"
      else
        flash[:error] = "That idea is private. Only its creator can view it."
      end
    end
  end

  def index
    @ideas = Idea.paginate(page: params[:page], order: 'created_at DESC')
  end

  def edit

  end

  def new
  	@idea = current_user.ideas.new
  end

  def create
  	if @idea = current_user.ideas.create(params[:idea])
      flash[:success] = "Idea successfully created."
  		render "show"
  	else
  		flash[:error] = "Error saving idea. Check that all forms are complete."
      render "new"
  	end
  end
end
