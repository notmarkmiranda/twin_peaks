class Users::ActivateController < ApplicationController
  def update
    @user = User.find(params[:user_id])
    if @user.activate
      redirect_to @user
    else
      redirect_to request.referrer
    end
  end
end
