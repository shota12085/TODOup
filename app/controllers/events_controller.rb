class EventsController < ApplicationController
  before_action :set_event, only: [:show, :destroy ]
  before_action :level, only: :index
  before_action :message, only: :index
  before_action :task, only: :index
  def index
    @event = Event.new
    @acquisition = Acquisition.new
    @set = LevelSet.new
    @events = current_user.events
    @success = current_user.acquisitions
    @acquisitions = current_user.acquisitions.count
    gon.acquisition = @acquisition
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
    
  end
  
  def task
    @todo = Event.where(task: "ToDo",user_id: current_user.id,date: Time.zone.now).order(created_at: "DESC")
    @day = Event.where(task: "日課",user_id: current_user.id,date: Time.zone.now).order(created_at: "DESC")
    @must = Event.where(task: "習慣",user_id: current_user.id).order(created_at: "DESC")
    @dayTodo = Acquisition.where(user_id: current_user,date: Time.zone.now).order(created_at: "DESC")
    @clear = @dayTodo.count
    @gage = @todo.count + @day.count + @clear
    @levels = (@clear.to_f/@gage)*100
    gon.gage = @levels
  end
  
  def message
    @acquisitions = current_user.acquisitions.count
    @level_set = LevelSet.find_by(level: current_user.level )
    @level_up = LevelSet.find_by(level: current_user.level + 1)
    @thresold_in = @level_set.thresold
    @thresold_up = @level_up.thresold
    @thresolds = @thresold_up - @thresold_in
    @thresold  = @thresold_up - @acquisitions
    gon.thresold_in = @thresold_in
    gon.ex_point = current_user.ex_point
    gon.level = current_user.level
  end
  
  
  def level
    user = current_user
    exp  = user.acquisitions.count
    user.ex_point = exp
    user.update(ex_point: exp)
  
    level_set = LevelSet.find_by(level: user.level + 1)
    
    if level_set.thresold <= user.ex_point
      user.level = user.level + 1
      user.update(level: user.level)
    end
    return user.level
  end
  helper_method :level
  
  
  def show
    
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      respond_to do |format|
        format.html{ redirect_to root_path}
        format.json
      end
    end
  end
  
  def destroy
    @event.destroy
    redirect_to root_path
  end



  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:content, :task, :date, :user_id).merge(user_id: current_user.id)
  end
end
