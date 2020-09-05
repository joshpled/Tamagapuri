class InventoriesController < ApplicationController
  before_action :authenticate_user!

  def create
    inventory = Inventory.new(inventory_params)
    message = inventory.exist?
    redirect_to items_path, flash: { message: message }
  end

  private

  def inventory_params
    params.require(:inventory).permit(:user_id, :item_id, :quantity)
  end
end
