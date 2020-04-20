class AcquisitionsController < ApplicationController

  def create
    @acquisition = Acquisition.create(acquisition_params)
    redirect_to root_path
  end

  def destroy
    @acquisition = Acquisition.find(params[:id])
    @acquisition.destroy
    redirect_to root_path
  end

  private

  def acquisition_params
    params.require(:acquisition).permit(:content, :task, :date, :user_id).merge(user_id: current_user.id)
  end
end
