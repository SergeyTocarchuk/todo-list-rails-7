class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!

  protected

  def authenticate_admin!
    redirect_to root_path, notice: 'no no no' unless current_user&.admin?
  end
end
