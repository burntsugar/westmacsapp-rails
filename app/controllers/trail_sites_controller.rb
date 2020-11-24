# /app/controllers/trail_sites_controller.rb

class TrailSitesController < ApplicationController
  def index
    @trail_sites = TrailSite.all.order(distance_from_trail_start: :asc)
  end

  def new
    @trail_site = TrailSite.new
    @observations = @trail_site.observations.build
    format_optionals
  end 

  def create
    @trail_site = TrailSite.new(trail_site_params)
    if @trail_site.save
      redirect_to @trail_site
    else
      render 'new'
    end
  end

  def edit
    @trail_site = TrailSite.find(params[:id])
  end

  def show
    @trail_site = TrailSite.find(params[:id])
    # For partial.
    @loggable = @trail_site
  end

  def destroy
    @trail_site = TrailSite.find(params[:id])
    @trail_site.destroy
    redirect_to trail_sites_path
  end 

  private

  def format_optionals
    if @trail_site.elevation == 0 || @trail_site.elevation == nil
      @trail_site.elevation = ''
    end
  end

  def trail_site_params
      params.require(:trail_site).permit(:is_trail_head,:section_number,:distance_from_trail_start, :name, :description, :latitude, :longitude, :elevation)
  end

end
