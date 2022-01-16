class Admins::ItemsController < Admins::BaseController
  before_action :authenticate_admin!

  # GET /items/1 or /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @list = List.all.find_by id: params[:list_id]
    @item = Item.new
  end

  # POST /items or /items.json
  def create
    @list = List.all.find_by id: params[:list_id]
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to admins_list_path(@item.list_id), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /items/1/edit
  def edit
    @list = List.all.find_by id: params[:list_id]
    @item = @list.items.find_by id: params[:id]
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    @list = List.all.find_by id: params[:list_id]
    @item = @list.items.find_by id: params[:id]

    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to admins_list_path(@list), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @list = List.all.find_by id: params[:list_id]
    @item = @list.items.find_by id: params[:id]
    @item.destroy

    respond_to do |format|
      format.html { redirect_to admins_list_path(@list), notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def complete
    @item = Item.find(params[:id])
    @item.is_completed = true
    @item.save
    redirect_to admins_list_path(@item.list_id)
  end

  def incomplete
    @item = Item.find(params[:id])
    @item.is_completed = nil
    @item.save
    redirect_to admins_list_path(@item.list_id)
  end

  def search
  end

  def search_show
    @list = List.all.find_by id: params[:list_id]
    @items = Item.all.where("content LIKE ?", "%" + params[:query] + "%")
    @items = @items.filter_by_status(params[:status]) if params[:status].present?
    @items = @items.filter_by_priority(params[:priority]) if params[:priority].present?
  end

  private

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:content, :is_completed, :priority, :list_id, images: [])
    end
end
