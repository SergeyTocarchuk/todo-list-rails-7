class UsersController < ApplicationController
  
  def index
    @pagy, @users = pagy(User.all, items: 5)
  end

  def show
  end
end
