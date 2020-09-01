class ItemsController < ApplicationController

    def new
        @store = Store.find_by_id(params[:store_id])
        @item = Item.new
    end

    def create
        @store = Store.find_by_id(params[:store_id])
        @item = Item.new(item_params)
        @item.store_item(@store)
          if @item.id != nil
            flash[:success] = "Item successfully created"
            redirect_to store_path(@item.store)
        else
          flash[:error] = "error"
          render 'new'
        end
    end

    def show
      @item = Item.find_by_id(params[:id])
    end

    private

    def item_params
        params.require(:item).permit(:name,:price,:store_stock,:item_type,:effectiveness)
    end
    
end
