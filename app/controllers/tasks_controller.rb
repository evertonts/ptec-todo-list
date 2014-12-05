class TasksController < ApplicationController
  respond_to :js
  before_filter :authenticate_user!

  def create
    @task = current_user.lists.find(task_params[:list_id]).tasks.create(task_params)
    respond_with(@task)
  end

  private

  def task_params
    params.require(:task).permit(:description, :list_id)
  end
end
