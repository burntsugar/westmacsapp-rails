# /app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
    require_relative '../wma_logic/offline_data.rb'
    include OfflineData

    puts 'OH HAI'
end
