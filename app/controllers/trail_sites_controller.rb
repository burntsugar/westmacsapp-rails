
class TrailSitesController < ApplicationController
  def index
    @trail_sites = TrailSite.all
  end

  def new
    @trail_site = TrailSite.new
  end 

  def create
    @trail_site = TrailSite.new(article_params)

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
  def article_params
      # The white list.
      params.require(:trail_site).permit(:is_trail_head,:section_number,:distance_from_trail_start)
  end

end
