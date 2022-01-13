class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @admin = current_member
  end
end
