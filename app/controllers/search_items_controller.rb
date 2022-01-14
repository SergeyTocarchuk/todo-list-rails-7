class SearchItemsController < ApplicationController
  def show
    @pagy, @lists = pagy(current_member.lists.where("name LIKE ?", "%" + params[:query] + "%"), items: 5)
  end

  def search
  end
end
