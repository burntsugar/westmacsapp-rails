
# ⛰️ RAILSIFYING WESTMACSAPP

This is mine-all-mine.

Developing WestMacsApp across multiple platforms. The first one to grow wings, wins. See most recent C# prototype [WestMacsAppCoreCS](https://github.com/burntsugar/WestMacsAppCoreCS) for context.

1. Polymophic associations: loggable type Observation applies to TrailSite and Facility

Stand by...

## Custom Trail config

````ruby
#/config/application.rb
config.custom_trail = config_for(:custom_trail)
````

````yaml
#/config/customer_trail.yml
shared:
   num_of_sections: 12
   max_distance_from_trail_start: 235
   bbox_max_lat: -22.00
   bbox_min_lat: -24.00
   bbox_min_lng: 131.00
   bbox_max_lng: 134.00
   min_elevation: 500.0
   max_elevation: 2000.0
````

## Dump and run
`rake db:reset db:migrate`

`rails s`

## RSpec

`bundle exec rspec`



