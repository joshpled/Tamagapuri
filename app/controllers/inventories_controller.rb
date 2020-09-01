class InventoriesController < ApplicationController

    def create
        inventory = Inventory.new(inventory_params)
        inventory.verify_inventory
        redirect_to store_path(Store.find_by_id(item.store_id))
    end
    
    private

    def inventory_params
        params.require(:inventory).permit(:user_id,:item_id,:quantity)
    end

end