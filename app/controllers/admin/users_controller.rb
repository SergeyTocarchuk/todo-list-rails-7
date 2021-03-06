class Admin::UsersController < Admin::BaseController
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
        format.html { redirect_to admin_users_path, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.lists.destroy_all
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: "User was successfully removed." }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params[:user].permit(:email, :admin)
  end
end
