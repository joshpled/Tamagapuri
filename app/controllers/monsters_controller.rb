class MonstersController < ApplicationController

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
            render 'new'
        end 
    end

    def show
        @monster = Monster.find_by_id(params[:id])
    end

    def destroy
        @monster = Monster.find_by_id(params[:id])
        @monster.destroy
        redirect_to root_path
    end

    def update
        @monster = Monster.find_by_id(params[:id])
        if @monster
            @monster.update(params)
            redirect_to user_monster_path(@monster)
        else
            render 'show'
        end
    end
    
    private

    def monster_params
        params.require(:monster).permit(:name, :age, :health, :happiness, :hunger, :boredom)
    end

end
