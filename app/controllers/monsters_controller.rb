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
            flash.now[:message] = "#{@monster.errors.messages.keys[0].to_s.capitalize} #{@monster.errors.messages.values[0][0].to_s}"
            render 'new'
        end 
    end

    def show
        @monster = Monster.find_by_id(params[:id])
    end

    def destroy
        @monster = Monster.find_by_id(params[:id])
        @monster.destroy
        flash.now[:message] = "Monster was successfully deleted"
        redirect_to root_path
    end

    def update_attributes
        # byebug
        @monster = Monster.find_by_id(params[:id])
        item = @monster.give_item_to_monster(params)
        if item != nil
            redirect_to user_monster_path(@monster)
        else
            render 'show'
        end
    end

    def edit
        @monster = Monster.find_by_id(params[:id])
    end

    def update
        @monster = Monster.find(params[:id])
        if @monster.update_attributes(monster_params)
          flash.now[:message] = "Monster was successfully updated"
          redirect_to user_monster_path(@monster)
        else
          flash.now[:message] = "#{@monster.errors.messages.keys[0].to_s.capitalize} #{@monster.errors.messages.values[0][0].to_s}"
          render 'edit'
        end
    end
    
    
    private

    def monster_params
        params.require(:monster).permit(:name, :age, :health, :happiness, :hunger, :boredom, :color)
    end

end
