class GoalsController < ApplicationController
  before_action :require_logged_in

  def index
    public_goals = Goal.all.where(private_goal: false)
        .where.not(user_id: current_user.id)
    our_goals = current_user.goals
    @goals = public_goals + our_goals
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.author_id = current_user.id #come back to break later
    if @goal.save
      redirect_to user_url(@goal.author_id)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def goal_params
    params.require(:goal).permit(:description, :title, :private_goal, :completed)
  end
end
