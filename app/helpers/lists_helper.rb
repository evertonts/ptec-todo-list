module ListsHelper
  def can_create_task_for(list)
    list.user == current_user
  end
end
