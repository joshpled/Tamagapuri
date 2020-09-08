class SlotMachinesController < ApplicationController
  before_action :authenticate_user!

  def show
    @slot = SlotMachine.new
  end

  def update
    @slot = SlotMachine.new
    @array = @slot.outcomes
    @slot = SlotMachine.create(slot_1: @array[0], slot_2: @array[1], slot_3: @array[2])
    flash.now[:won] = @slot.bid(current_user)
    render "show"
  end
end
