class ItemsController < ApplicationController

    def user_items
      @user = User.find_by_id(current_user.id)
    end

    def new
        @store = Store.find_by_id(params[:store_id])
        @item = @store.items.new
    end

    def create
        @store = Store.find_by_id(params[:store_id])
        @item = @store.items.create(item_params)
        if @item.save
          flash[:success] = "Item successfully created"
          redirect_to store_path(@item.store)
        else
          flash[:error] = "Something went wrong"
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
