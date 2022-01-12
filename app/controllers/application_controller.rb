class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :authenticate_admin!
  devise_group :member, contains: [:user, :admin]

  def after_sign_in_path_for(user)
    lists_path
  end

  def after_sign_in_path_for(admin)
    lists_path
  end
end
