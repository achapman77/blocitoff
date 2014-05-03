class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to :back
  end

  def destroy
    @task = Task.find(params[:id])
    name = @task.name

    authorize @task

    if @task.destroy
      flash[:notice] = "\"#{name}\" was removed."
      redirect_to tasks_path
    else
      flash[:error] = "There was an error deleting the task."
      render :show
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :completed)
  end
end
