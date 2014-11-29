class TasksController < ApplicationController
  respond_to :js

  def create
    @task = Task.create(task_params)
    respond_with(@task)
  end

  private

  def task_params
    params.require(:task).permit(:description, :list_id)
  end
end
