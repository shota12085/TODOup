class LevelSetsController < ApplicationController

  def create
    @level = LevelSet.create(level_params)
  end

  private

  def level_params
    params.require(:level_set).permit(:level, :thresold)
  end
end
