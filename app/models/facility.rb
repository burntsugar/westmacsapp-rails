
#/app/model/facility.rb

class Facility < ApplicationRecord
    has_many :observations, as: :loggable # Will be assigned loggable_id 1 as it preceeds all other loggable declarations in the model (by alpha).

    enum name_type: [:tank_water, :shelter, :toilet,:parking_area, :usb_charging_station, :tap_water, :shower]
end
