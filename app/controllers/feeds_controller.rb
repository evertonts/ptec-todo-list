class FeedsController < ApplicationController
   def show
      @user = current_user
      @feeds = @user.feeds
   end
end
