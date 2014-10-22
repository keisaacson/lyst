require 'pry-byebug'

class SharesController < ApplicationController
  before_action :authenticate_user!

  def create
    if params[:share][:user_id] != ""
      @share = Share.new(share_params)
      @share.share_access = "write"
      @share.favorite = "no"
      @share.save
    end
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  def update
    @share = Share.find(params[:id])
    @share.update(share_params)
  end

  def destroy
    @share = Share.find(params[:id])
    @share.destroy
  end

private
  def share_params
    params.require(:share).permit(:user_id, :list_id, :share_access, :favorite)
  end

end