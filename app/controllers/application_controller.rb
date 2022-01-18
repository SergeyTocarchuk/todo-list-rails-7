class ApplicationController < ActionController::Base
  include Pagy::Backend
  
  def after_sign_in_path_for(user)
    users_lists_path(user)
  end

  def after_sign_in_path_for(admin)
    admins_admin_path(admin)
  end
end
