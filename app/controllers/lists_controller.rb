require 'pry-byebug'

class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists
    @shares = current_user.shares
  end

  def index_public
    @public_lists = List.where(list_type: "public").order("updated_at desc").limit(10)
    @public_lists_all = List.where(list_type: "public")
  end

  def public_search
    @public_lists_all = List.where(list_type: "public")
    @search_results = List.where("list_type = 'public'").where("UPPER(title) LIKE UPPER(?)", "%#{params[:list][:search]}%")
  end

  def show
    lists = current_user.lists
    shares = current_user.shares
    list_accesses = lists.map {|l| l.id}
    shares.each {|s| list_accesses << s.list_id}
    if list_accesses.include?(params[:id].to_i)
      @list = List.find(params[:id])
      @users = User.all
    else
      redirect_to lists_path
    end
  end

  def new
    @list = List.new
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
