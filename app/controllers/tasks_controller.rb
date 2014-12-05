class TasksController < ApplicationController
  respond_to :js
  before_filter :authenticate_user!

  def create
    @task = list.tasks.create(task_params)
    respond_with(@task)
  end

  def update
    @task = list.tasks.find(task_params[:id])
    @task.update(task_params)
    redirect_to list_path(list)
  end

  private

  def task_params
    params.require(:task).permit(:id, :description, :list_id, :done)
  end

  def list
    @list ||= current_user.lists.find(task_params[:list_id])
  end
end
