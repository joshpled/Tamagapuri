class InventoriesController < ApplicationController

    def create
        inventory = Inventory.new(inventory_params)
        store = Store.find_by_id(params[:inventory][:store_id])
        @user = current_user
        message = inventory.exist?
        redirect_to store_path(store), flash: { message: message }
    end
    
    private

    def inventory_params
        params.require(:inventory).permit(:user_id,:item_id,:quantity)
    end

end