class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show complete incomplete]
  before_action :authenticate_user!

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @list = current_user.lists.find_by id: params[:list_id]
    @item = Item.new
  end

  # POST /items or /items.json
  def create
    @list = current_user.lists.find_by id: params[:list_id]
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to list_path(@item.list_id), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /items/1/edit
  def edit
    @list = current_user.lists.find_by params[:id]
    @item = @list.items.find_by params[:id]
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    @list = current_user.lists.find_by params[:id]
    @item = @list.items.find_by params[:id]

    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to list_item_path(@item.list_id, @item.id), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @list = current_user.lists.find_by params[:list_id]
    @item = @list.items.find_by params[:id]
    @item.destroy

    respond_to do |format|
      format.html { redirect_to list_path(@list), notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def complete
    @item.is_completed = true
    @item.save
    redirect_to list_path(@item.list_id)
  end

  def incomplete
    @item.is_completed = nil
    @item.save
    redirect_to list_path(@item.list_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:content, :is_completed, :list_id, images: [])
    end
end
