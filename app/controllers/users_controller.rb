class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @pagy, @users = pagy(User.all, items: 5)
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path, notice: "User was successfully removed." }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params[:user].permit(:email, :admin)
  end

  def require_admin
    if !(user_signed_in? && current_user.admin)
      flash[:alert] = "Only admins can perform that action"
      redirect_to root_path
    end
  end

end
