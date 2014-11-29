class ListsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @list = List.new
    respond_with(@list)
  end

  def create
    @list = List.create(list_params)
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
