module OfflineData 
    
    @@file = File.join(Rails.root, 'app', 'wma_logic', 'new_data.json')
    @@file_string = File.read(@@file)

    def OfflineData::make_data_hash
        ActiveSupport::JSON.decode(@@file_string)
    end

    @@main_obj_array = []

    def OfflineData::make_trail_sites()
        dh = make_data_hash
        h = dh['trailsites'] + dh['campsites']
        h.each do |key,value|
            key.delete('other_names')
            key.delete('coords')
            key.delete('observations')
            key.delete('facilities')
            my_object = TrailSite.new(key)
            @@main_obj_array << my_object
        end
    end

    def OfflineData::save_trail_sites
        @@main_obj_array.each do |o|
            o.save
        end
    end

    def OfflineData::process_trailsite_observations()
        dh = make_data_hash
        h = dh['trailsites'] + dh['campsites']
        h.each do |key,value|
            @trail_site = TrailSite.find_by(name: key['name'])
            @observations = @trail_site.observations.build
            key['observations'].each do |o|
                @observation = @trail_site.observations.new(o)
                @observation.save
            end
        end
         
    end

    make_trail_sites
    save_trail_sites
    process_trailsite_observations
    
end