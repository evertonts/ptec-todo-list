class UsersController < ApplicationController
  respond_to :html

  def show
    @user = User.find(params[:id])
    respond_with(@user)
  end

  def home
    @user = current_user
    respond_with(@user)
  end
end
