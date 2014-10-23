require 'pry-byebug'

class SharesController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user
      @share = Share.new(share_params)
      @share.user_id = @user.id
      @share.share_access = "write"
      @share.favorite = "no"
      @share.save
      respond_to do |format|
        format.js { render :layout => false }
      end
    else
      flash[:error] = "There was an error sharing the list with that user."
      redirect_to 
    end
  end

  def destroy
    @share = Share.find(params[:id])
    @share.destroy
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

private
  def share_params
    params.require(:share).permit(:list_id)
  end

end