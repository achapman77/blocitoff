class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to :back
  end

  private

  def task_params
    params.require(:task).permit(:description, :completed)
  end
end
