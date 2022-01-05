class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :authenticate_user!

  def after_sign_in_path_for(user)
    lists_path
  end
end
