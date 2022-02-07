class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @user = current_user
    @user_list = UserList.new(user_id: @user.id)
    @list = @user_list.build_list
  end

  def create
    @user = current_user
    @user_list = UserList.new(user_id: @user.id)
    @list = @user_list.build_list(list_params)
    respond_to do |format|
      if @list.save
        @user_list.save
        format.html { redirect_to lists_path, notice: "List was successfully created." }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])

    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to list_path(@list), notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_path, notice: "List was successfully removed." }
      format.json { head :no_content }
    end
  end

  def search
  end

  def search_show
    @pagy, @lists = pagy(current_user.lists.where("name LIKE ?", "%" + params[:query] + "%"), items: 5)
  end

  def show_daily_items
    @pagy, @items = pagy(Item.daily_list(current_user.id), items: 5)
  end

  def find_user_to_share_with
    @user_list = UserList.new
  end

  def share_list
    # TODO, restore form to send user_id
    @user_list = UserList.new(user: User.find_by(email: params[:user_list][:user_email]), list_id: params[:id])
    if @user_list.save
      redirect_to lists_path
    end
  end

    def user_list_options
      ids = UserList.where(list_id: params[:list_id]).pluck(:user_id)
      users = User.where.not(id: ids).where('email like ?', "#{params[:key]}%").limit(10).select(:id, :email)
      render json: users
    end

  private

  def list_params
    params.require(:list).permit(:name, :type_of_list)
  end

end
