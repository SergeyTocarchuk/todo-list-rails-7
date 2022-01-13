class ApplicationController < ActionController::Base
  include Pagy::Backend
  devise_group :member, contains: [:user, :admin]
  before_action :authenticate_member!
  
  def after_sign_in_path_for(user)
    lists_path(user)
  end

  def after_sign_in_path_for(admin)
    admin_path
  end
end
