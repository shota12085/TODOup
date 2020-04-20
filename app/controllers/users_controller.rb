class UsersController < ApplicationController
  before_action :acquisition_group_by
  def show
    @users = User.all.order(ex_point: "DESC").limit(10)
    
  end
  
  def acquisition_group_by
    @events = Acquisition.where(user_id: current_user.id).order(created_at: "DESC").group_by{|acquisition| acquisition.created_at.to_date.strftime('%Y年%-m月%d日')}
    gon.acquisition_group_by = @events
  end


end
