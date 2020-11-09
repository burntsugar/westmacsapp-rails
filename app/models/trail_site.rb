
class TrailSite < ApplicationRecord
    has_many :observations, as: :loggable


    # is_trail_head : boolean
    validates_inclusion_of :is_trail_head, presence: true, in: [true, false]
    # section number
    validates :section_number, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: Rails.configuration.custom_trail.num_of_sections }
    # distance_from_trail_start
    validates :distance_from_trail_start, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: Rails.configuration.custom_trail.max_distance_from_trail_start }
    # name
    validates :name, presence: true, length: {minimum: 1} 
    # description
    validates :description, presence: true, length: {minimum: 1}
    # latitude
    validates :latitude, numericality: { only_float: true, :greater_than_or_equal_to => 0, allow_nil: true}
    # longitude
    validates :longitude, numericality: { only_float: true, :greater_than_or_equal_to => 0, allow_nil: true}
    # elevation
    validates :elevation, numericality: { only_integer: true, :greater_than_or_equal_to => 0, allow_nil: true }

    after_validation :log_errors, :if => Proc.new {|m| m.errors}

    def log_errors
        Rails.logger.debug self.errors.full_messages.join("\n")
    end

    after_initialize :init
  
    private
    def init
        if self.new_record? && self.elevation.nil?
            self.elevation = 0
        end
        # TODO: is_trail_head false
        # TODO: latitude 0
        # TODO: longitude 0
    end
end
