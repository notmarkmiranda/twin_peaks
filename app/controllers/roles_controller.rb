class RolesController < ApplicationController
  before_action :require_admin

  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      redirect_to @role
    else
      render :new
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  private

  def role_params
    params.require(:role).permit(:title)
  end
end
