class Users::DeactivateController < ApplicationController
  def update
    @user = User.find(params[:user_id])
    if @user.deactivate
      redirect_to @user
    else
      redirect_to request.referrer
    end
  end
end
