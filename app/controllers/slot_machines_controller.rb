class SlotMachinesController < ApplicationController
  before_action :authenticate_user!

  def show
    @slot = SlotMachine.new
  end

  def update
    @slot = SlotMachine.new
    @slot.outcomes
    flash.now[:won] = @slot.bid(current_user)
    render "show"
  end
end
