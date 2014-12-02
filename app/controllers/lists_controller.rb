class ListsController < ApplicationController
  before_filter :authenticate_user!
  before_action :permit_see, only: :show

  def new
    @list = List.new
    respond_with(@list)
  end

  def create
    @list = List.create(list_params.merge(user_id: current_user.id))
    respond_with(@list)
  end

  def show
    @list = List.find(params[:id])
    respond_with(@list)
  end

  def add_favorite
    @list = List.find(params[:id])
    current_user.add_favorite(@list)
    respond_with(@list) do |format|
      format.js { render 'update_favorite' }
    end
  end

  def remove_favorite
    @list = List.find(params[:id])
    current_user.remove_favorite(@list)
    respond_with(@list) do |format|
      format.js { render 'update_favorite' }
    end
  end

  def favorites
    @lists = current_user.favorite_lists
    respond_with(@lists)
  end

  private

  def list_params
    params.require(:list).permit(:name, :particular)
  end

  def permit_see
    @list = List.find(params[:id])
    if @list.particular && @list.user != current_user
      redirect_to authenticated_root_path, alert: 'You cannot see this list'
    end
  end
end
