class FacilityController < ApplicationController
  def index
    @facilities = Facility.all
  end
  def show
    @facility = Facility.find(params[:id])
  end
  def new
    @facility = Facility.new
    @observations = @facility.observations.build
  end
  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      redirect_to @facility
    else
      render 'new'
    end
    # byebug
    # logger.debug(trail_site_params)
  end
  def edit
    @facility = Facility.find(params[:id])
  end

  private
  def facility_params
      # The white list.
      params.require(:facility).permit(:name_type,:description)
  end
end
