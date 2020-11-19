
class TrailSitesController < ApplicationController
  def index
    @trail_sites = TrailSite.all
  end

  def new
    @trail_site = TrailSite.new
    format_optionals
  end 

  def format_optionals
    if @trail_site.elevation == 0 || @trail_site.elevation == nil
      @trail_site.elevation = ''
    end
    # TODO: is_trail_head
    # TODO: latitude
    # TODO: longitude
  end

  def create
    # byebug
    # logger.debug(trail_site_params)
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
  end

  def destroy
    @trail_site = TrailSite.find(params[:id])
    @trail_site.destroy
    
    redirect_to trail_sites_path
  end 

  private
  def trail_site_params
      # The white list.
      params.require(:trail_site).permit(:is_trail_head,:section_number,:distance_from_trail_start, :name, :description, :latitude, :longitude, :elevation)
  end

end
