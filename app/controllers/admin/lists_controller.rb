class Admin::ListsController < Admin::BaseController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @user = User.find_by id: params[:list][:user_id]
    @user_list = UserList.new(user_id: @user.id)
    @list = @user_list.build_list(list_params)
    @list.avatar.attach(params[:avatar])
    respond_to do |format|
      if @list.save
        @user_list.save
        format.html { redirect_to admin_lists_path, notice: "List was successfully created." }
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
        format.html { redirect_to admin_list_path(@list), notice: "List was successfully updated." }
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
      format.html { redirect_to admin_lists_path, notice: "List was successfully removed." }
      format.json { head :no_content }
    end
  end

  def search
  end

  def search_show
    @pagy, @lists = pagy(List.all.where("name LIKE ?", "%" + params[:query] + "%"), items: 5)
  end

  private

  def list_params
    params.require(:list).permit(:name, :avatar)
  end

end
