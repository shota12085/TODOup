class LevelSetsController < ApplicationController

  def create
    @level = LevelSets.create(level_params)
  end

  private

  def level_params
    params.require(:level_set).permit(:level, :thresold)
  end
end
