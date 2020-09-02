class ItemsController < ApplicationController
  def new
    @store = Store.find_by_id(params[:store_id])
    @item = Item.new
  end

  def create
    store = Store.find_by_id(params[:store_id])
    item = Item.new(item_params)
    message = store.store_item(item)
    if @item.id != nil
      redirect_to store_path(@item.store), flash: { message: message }
    else
      render "new", flash: { message: message }
    end
  end

  def show
    @item = Item.find_by_id(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :store_stock, :item_type, :effectiveness)
  end
end
