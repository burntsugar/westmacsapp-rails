# /app/controllers/observations_controller.rb

class ObservationsController < ApplicationController
  def show
    @observation = @loggable.observations.find(params[:id])
  end

  def new
    @observation = @loggable.observations.new
  end

  def create
    log_date_params = { log_date: Time.zone.now }
    @observation = @loggable.observations.new(observation_params.merge(log_date_params))
    @observation.save
    redirect_to @loggable
  end

  def edit
    @observation = @loggable.observations.find(params[:id])
  end

  def index
    @observations = Observation.all
  end

  def update
    @observation = @loggable.observations.find(params[:id])
    if @observation.update(observation_params)
      redirect_to @loggable
    else
      render 'edit'
    end
  end

  def destroy
    @observation = @loggable.observations.find(params[:id])
    @observation.destroy
    redirect_to @loggable
  end

  private

  def observation_params
    params.require(:observation).permit(:author_name, :note, :trail_site_id, :id, :log_date)
  end
end
