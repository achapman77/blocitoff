class TasksController < ApplicationController
  respond_to :html, :js

  def index
    @task = Task.new
    @tasks = Task.all
    authorize @task
  end

  def new
    @task = current_user.tasks.new
    authorize @task
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = current_user.tasks.create(task_params)
    authorize @task

    if @task.save
    flash[:notice] = "Hooray! Task was saved."
    else
    flash[:error] = "Ooops!  Task wasn't saved."
    end

    respond_with(@task) do |f|
      f.html { redirect_to tasks_path }
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])
    authorize @task

    if @task.update_attributes(:done, true)
      flash[:notice] = "Task completed."
      redirect_to task_index_path, :notice => "Task marked as done."
    else
      redirect_to task_index_path, :error => "Unable to mark task as done."
    end
  end


  def destroy
    @task = Task.find(params[:id])
    authorize @task

    if @task.destroy
      flash[:notice] = "Task was removed."
    else
      flash[:error] = "There was an error deleting the task."
    end

    respond_with(@task) do |f|
      f.html { redirect_to tasks_path }
    end
  end

  def completed
    @task = Task.find(params[:id])
    #authorize @task
    @task.completed = true

    if @task.save
      flash[:notice] = "Task was completed."
    else
      flash[:error] = "There was an error completing the task."
    end
    redirect_to tasks_path
    #respond_with(@task) do |f|
     # f.html { redirect_to tasks_path }
    #end
  end

  private

  def task_params
    params.require(:task).permit(:description, :completed)
  end
end
