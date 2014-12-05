module TasksHelper
  def display_done(task)
    task.done? ? 'undone' : 'done'
  end
end
