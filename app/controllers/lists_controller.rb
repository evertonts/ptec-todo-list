class ListsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @list = List.new
    respond_with(@list)
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    @list.save
    respond_with(@list)
  end

  def show
    @list = List.find(params[:id])
    respond_with(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name, :particular)
  end
end
