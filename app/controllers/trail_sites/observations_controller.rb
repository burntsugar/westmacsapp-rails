# /app/controllers/trail_sites/ObservationsController.rb

class TrailSites::ObservationsController<ObservationsController
before_action :set_loggable

private

    def set_loggable
        @loggable = TrailSite.find(params[:trail_site_id])
    end
end