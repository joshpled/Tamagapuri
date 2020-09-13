class MonstersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @user = User.find_by_id(current_user.id)
    @monster = @user.monsters.new
  end

  def create
    @user = User.find_by_id(current_user.id)
    @monster = @user.monsters.create(monster_params)
    if @monster.save
      redirect_to root_path
    else
      flash.now[:name_error] = "#{@monster.errors.full_messages[0]}"
      render "new"
    end
  end

  def show
    @monster = Monster.find_by_id(params[:id])
    @monster.monster_age
  end

  def destroy
    @monster = Monster.find_by_id(params[:id])
    @monster.destroy
    redirect_to root_path
  end

  def update_attributes
    @monster = Monster.find_by_id(params[:id])
    item = @monster.give_item_to_monster(params)
    if item != nil
      redirect_to monster_path(@monster)
    else
      render "show"
    end
  end

  def edit
    @monster = Monster.find_by_id(params[:id])
  end

  def update
    @monster = Monster.find(params[:id])
    if @monster.update_attributes(monster_params)
      redirect_to monster_path(@monster)
    else
      flash.now[:message] = "#{@monster.errors.full_messages[0]}"
      render "edit"
    end
  end

  private

  def monster_params
    params.require(:monster).permit(:name, :age, :health, :happiness, :hunger, :boredom, :color)
  end

end
