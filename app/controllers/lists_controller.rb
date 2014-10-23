require 'pry-byebug'

class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists
    @shares = current_user.shares
    @public_lists = List.where(list_type: "public").order("updated_at desc").limit(10)
  end

  def show
    @list = List.find(params[:id])
    @users = User.all
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    @list.list_type = "private"
    @list.save
    redirect_to list_path(@list.id)
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  def destroy
    @list = List.find(params[:id])
    @shares = @list.shares
    @items = @list.items
    @list.destroy
    @items.each {|i| i.destroy }
    @shares.each {|s| s.destroy }
    respond_to do |format|
      format.html { redirect_to lists_path}
      format.js { render :layout => false }
    end
  end

  private
    def list_params
      params.require(:list).permit(:title, :list_type)
    end
end
