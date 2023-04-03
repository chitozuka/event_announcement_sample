class EventsController < ApplicationController
  skip_before_action :authenticate, only: :show

  def show
    @event = Event.find(params[:id])
    @tickets = @event.tickets.includes(:user).order(:created_at)
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    redirect_to @event, notice: '作成しました' if @event.save
  end

  def edit
    @event = current_user.created_events.find(params[:id])
  end

  def update
    @event = current_user.created_events.find(params[:id])
    redirect_to @event, notice: '更新しました' if @event.update(event_params)
  end

  def destroy
    @event = current_user.created_events.find(params[:id])
    redirect_to root_path, notice: '削除しました' if @event.destroy!
  end

  private

  def event_params
    params.require(:event).permit(
      :name, :place, :content, :start_at, :end_at
    )
  end
end
