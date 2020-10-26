
class TrailSite < ApplicationRecord
    has_many :observations, as: :loggable

    validates_inclusion_of :is_trail_head, presence: true, in: [true, false]

    validates :section_number, presence: true, numericality: { greater_than: 0 }

    validates :distance_from_trail_start, presence: true, numericality: { greater_than: 0 }

    after_validation :log_errors, :if => Proc.new {|m| m.errors}

    def log_errors
        Rails.logger.debug self.errors.full_messages.join("\n")
    end
end
