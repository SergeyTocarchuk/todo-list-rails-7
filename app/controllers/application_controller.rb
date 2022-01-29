class ApplicationController < ActionController::Base
  include Pagy::Backend

  def after_sign_in_path_for(_)
    lists_path
  end

  # TODO move it out of this controller it its own
  def user_list_options
    ids = UserList.where(list_id: params[:list_id]).pluck(:user_id)
    users = User.where.not(id: ids).where('email like ?', "#{params[:key]}%").limit(10).select(:id, :email)
    render json: users
  end
end
