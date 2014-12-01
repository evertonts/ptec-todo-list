module ListsHelper
  def can_create_task_for(list)
    list.user == current_user
  end

  def favorited_list?(list)
    current_user.favorite_lists.include?(list)
  end

  def show_favorite?(list)
    list.user != current_user
  end
end
