

class ObservationsController < ApplicationController
  def index
    @observations = Observation.all
  end

  def new
    @observation = Observation.new
  end

  def edit
  end

  def update
  end

  def create

    obs = Observation.create(author_name: params[:observation][:author_name],note: params[:observation][:note], log_date: DateTime.now, loggable_id:params[:trail_site_id], loggable_type: "TrailSite")
    obs.save

    #byebug
    #logger.debug
   
  end

  def show
    @observation = Observation.new
  end

  def destroy
  end

  # private
  # def observation_params
  #     params.require(:observation).permit(:author_name, :note)
  # end
end
