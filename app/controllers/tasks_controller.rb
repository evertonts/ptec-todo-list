class TasksController < ApplicationController
  def create
    @task = Task.create(task_params)
    respond_with(@task) do |format|
      format.js
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :list_id)
  end
end
