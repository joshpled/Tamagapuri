class StoresController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to @store
    else
      render "new"
    end
  end

  def edit
    @store = Store.find_by_id(params[:id])
  end

  def update
    @store = Store.find_by_id(params[:id])
    if @store.update_attributes(store_params)
      flash[:success] = "Store was successfully updated"
      redirect_to @store
    else
      flash[:error] = "Something went wrong"
      render "edit"
    end
  end

  def show
    @store = Store.find_by_id(params[:id])
  end

  def destroy
    @store = Store.find_by_id(params[:id])
    @store.destroy
    redirect_to root_path
  end

  private

  def store_params
    params.require(:store).permit(:name, :store_type)
  end
end
