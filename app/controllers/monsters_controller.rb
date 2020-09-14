class MonstersController < ApplicationController
  before_action :authenticate_user!

  def new
    @monster = current_user.monsters.new
  end

  def create
    @monster = current_user.monsters.create(monster_params)
    if @monster.save
      redirect_to root_path
    else
      flash.now[:name_error] = "#{@monster.errors.full_messages[0]}"
      render "new"
    end
  end

  def show
    @monster = current_user.monsters.find_by_id(params[:id])
    @monster.monster_age
  end

  def destroy
    @monster = current_user.monsters.find_by_id(params[:id])
    @monster.destroy
    redirect_to root_path
  end

  def edit
    @monster = current_user.monsters.find_by_id(params[:id])
  end

  def update
    @monster = current_user.monsters.find_by_id(params[:id])
    if @monster.update(monster_params)
      redirect_to user_monster_path(@monster)
    else
      flash.now[:message] = "#{@monster.errors.full_messages[0]}"
      render "edit"
    end
  end

  def update_attributes
    @monster = current_user.monsters.find_by_id(params[:id])
    item = @monster.give_item_to_monster(params)
    if item != nil
      redirect_to user_monster_path(@monster)
    else
      render "show"
    end
  end

  

  private

  def monster_params
    params.require(:monster).permit(:name, :age, :health, :happiness, :hunger, :boredom, :color)
  end

end
