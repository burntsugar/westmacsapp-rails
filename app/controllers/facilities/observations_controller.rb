# /app/controllers/facilities/ObservationsController.rb
class Facilities::ObservationsController<ObservationsController
before_action :set_loggable

private

    def set_loggable
        @loggable = Facility.find(params[:facility_id])
    end
end