class AdminsController < ApplicationController
  def show
    @admin = current_member
  end
end
