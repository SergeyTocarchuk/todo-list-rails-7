class ListsController < ApplicationController
  before_action :authenticate_member!

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = current_user.lists.build(list_params)
    @list.avatar.attach(params[:avatar])
    respond_to do |format|
      if @list.save
        format.html { redirect_to lists_path, notice: "List was successfully created." }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
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

  def search
    @pagy, @lists = pagy(current_user.lists.where("name LIKE ?", "%" + params[:query] + "%"), items: 5)
  end

  def filter
    @list = current_user.lists.find_by params[:id]
    @items = @list.items.incompleted
  end

  private

  def list_params
    params.require(:list).permit(:name, :avatar)
  end

end
