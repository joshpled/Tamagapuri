class SlotMachinesController < ApplicationController
  before_action :authenticate_user!

  def show
    @slot = SlotMachine.new
  end

  def update
    @slot = SlotMachine.new
    @slot.outcomes
    @slot.bid = params[:slot_machine][:bid]
    flash.now[:won] = @slot.bid_game(current_user)
    render "show"
  end
  
end
