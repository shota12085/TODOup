class LevelSetsController < ApplicationController

  def create
    @level = LevelSet.new(level_params)
    @level.save
  end

  private

  def level_params
    params.permit(:level, :thresold)
  end
end
