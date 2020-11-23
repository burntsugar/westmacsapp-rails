module OfflineData 
    
    @@file = File.join(Rails.root, 'app', 'wma_logic', 'new_data.json')
    file_string = File.read(@@file)

    data_hash = ActiveSupport::JSON.decode(file_string)

    data_array = []
    data_hash['trailsites'].each do |key,value|
        key.delete('other_names')
        key.delete('coords')
        key.delete('observations')
        key.delete('facilities')
        my_object = TrailSite.new(key)
        data_array << my_object
    end

    data_hash['campsites'].each do |key,value|
        key.delete('other_names')
        key.delete('coords')
        key.delete('observations')
        key.delete('facilities')
        my_object = TrailSite.new(key)
        data_array << my_object
    end

    data_array.each do |o|
        o.save
    end
    
end