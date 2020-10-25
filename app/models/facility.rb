
class Facility < ApplicationRecord
    has_many :observations, as: :loggable

    enum name_type: [:tank_water, :shelter, :toilet, :parking_area :usb_charging_station, :tap_water, :shower]
end
