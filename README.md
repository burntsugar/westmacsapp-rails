
# ⛰️ RAILSIFYING WESTMACSAPP

Developing WestMacsApp across multiple platforms. The first one to grow wings, wins. See most recent C# prototype [WestMacsAppCoreCS](https://github.com/burntsugar/WestMacsAppCoreCS) for context.

Wanted to spend some time getting the polymorphic associations between Observation (loggable) types in good shape before running ahead into the fun stuff.

Using SQLite3 for now. Will jump back onto Postgres shortly.

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
````



