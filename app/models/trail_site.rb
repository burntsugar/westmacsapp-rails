
class TrailSite < ApplicationRecord
    has_many :observations, as: :loggable

    after_validation :log_errors, :if => Proc.new {|m| m.errors}

    def log_errors
        Rails.logger.debug self.errors.full_messages.join("\n")
    end
end
