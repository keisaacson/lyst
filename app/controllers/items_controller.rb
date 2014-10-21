require 'pry-byebug'

class ItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = Item.new(item_params)
    @item.list_id = params[:list][:id]
    @item.save
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  private
    def item_params
      params.require(:item).permit(:content)
    end
end
