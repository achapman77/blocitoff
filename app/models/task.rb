class Task < ActiveRecord::Base
  include ActionView::Helpers

  belongs_to :user

  def days_left
    distance_of_time_in_words(created_at, Date.today - 6.days)
  end

  def complete_toggle
    @task = Task.find param [:id]

    if @task.active?
      @task.active = false
      render :js => "alert('Active!);"
    else
      @task.active = true
      render :js => "alert('Inactive!');"
    end
  end
end
