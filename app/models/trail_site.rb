
class TrailSite < ApplicationRecord
    has_many :observations, as: :loggable
    # is_trail_head
    validates_inclusion_of :is_trail_head, presence: true, in: [true, false]
    # section_number
    validates :section_number, presence: true, numericality: { greater_than: 0 }
    # distance_from_trail_start
    validates :distance_from_trail_start, presence: true, numericality: { greater_than: 0 }
    # name
    validates :name, presence: true, length: {minimum: 1} 
    # description
    validates :description, presence: true, length: {minimum: 1}
    # latitude
    validates :latitude, numericality: { only_float: true, :greater_than => 0, allow_nil: true}
    # longitude
    validates :longitude, numericality: { only_float: true, :greater_than => 0, allow_nil: true}
    # elevation
    validates :elevation, numericality: { only_integer: true, allow_nil: true }

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
