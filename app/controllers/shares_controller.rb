class SharesController < ApplicationController
  before_action :authenticate_user!

  def create
    @share = Share.new(share_params)
    @share.save
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