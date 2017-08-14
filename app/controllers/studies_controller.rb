class StudiesController < ApplicationController
  def create
    @study = current_user.studies.new(study_params)
    if @study.save
      redirect_to @study
    else
      render :new
    end
  end

  private

  def study_params
    params.require(:study).permit(:study_type, :name, :alias, :status, :protocol_number)
  end
end
