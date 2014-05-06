class TasksController < ApplicationController
  respond_to :html, :js

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.create(task_params)

    if @task.save
    flash[:notice] = "Task was saved."
    redirect_to :back
    else
    flash[:error] = "There was an error saving the task. Please try again."
    redirect_to :back
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(:done, true)
      flash[:notice] = "Task completed."
      redirect_to task_index_path, :notice => "Task marked as done."
    else
      redirect_to task_index_path, :error => "Unable to mark task as done."
    end
  end


  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:notice] = "Task was removed."
    else
      flash[:error] = "There was an error deleting the task."
    end

    respond_with(@task) do |f|
      f.html { redirect_to tasks_path }
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :completed)
  end
end
