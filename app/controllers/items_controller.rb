class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items  = Item.all.alphabetical_sort
    @inventory = current_user.inventories.new
  end
end
