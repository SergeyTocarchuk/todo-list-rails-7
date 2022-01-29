class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!

  protected

  def authenticate_admin!
    current_user.present? && current_user.admin?
  end
end
