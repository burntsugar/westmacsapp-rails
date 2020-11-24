require 'rails_helper'

RSpec.describe Observation, :type => :model do

  before(:each) do
    @h_master = {is_trail_head: true, 
      section_number: Rails.configuration.custom_trail.num_of_sections, 
      distance_from_trail_start: Rails.configuration.custom_trail.max_distance_from_trail_start,
      name: "xxx",
      description: "xxx",
      latitude: Rails.configuration.custom_trail.bbox_max_lat,
      longitude: Rails.configuration.custom_trail.bbox_max_lng,
      elevation: Rails.configuration.custom_trail.max_elevation}

      @h_master_ob = {author_name: 'RACH', note: 'This is a rad note', log_date: '2019-07-11T07:00:00'}

      @trail_site = TrailSite.create(@h_master)
      @trail_site.observations.build
  end
  it "is created with all valid values" do
    observation = @trail_site.observations.create(@h_master_ob)
    expect(observation.errors).to be_empty
  end
  it "is not valid without an author_name" do
    @h_master_ob[:author_name]=""
    observation = @trail_site.observations.create(@h_master_ob)
    expect(observation.errors).to_not be_empty
  end
  it "is not valid without a note" do
    @h_master_ob[:note]=""
    observation = @trail_site.observations.create(@h_master_ob)
    expect(observation.errors).to_not be_empty
  end
  it "is not valid without a log date" do
    @h_master_ob[:log_date]=""
    observation = @trail_site.observations.create(@h_master_ob)
    expect(observation.errors).to_not be_empty
  end
  it "is not valid without a well formed log date" do
    @h_master_ob[:log_date]="something something"
    observation = @trail_site.observations.create(@h_master_ob)
    expect(observation.errors).to_not be_empty
  end
  
end