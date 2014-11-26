class ListsController < ApplicationController

  def new
    @list = List.new
  end

  def create
  end

  private

  def list_params
    params.require(:list).permit(:name, :particular)
  end
end
