#/app/model/observation.rb

class Observation < ApplicationRecord
    belongs_to :loggable, polymorphic: true

    # author_name
    validates :author_name, presence: true,
                    length: { minimum: 1 }
    # note
    validates :note, presence: true, length: {minimum: 1}
    # log_date
    validates :log_date, presence: true

    after_validation :log_errors, :if => Proc.new {|m| m.errors}

    def log_errors
        Rails.logger.debug self.errors.full_messages.join("\n")
    end
end
