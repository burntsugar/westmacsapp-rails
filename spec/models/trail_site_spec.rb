require 'rails_helper'

RSpec.describe TrailSite, :type => :model do

  before(:each) do
    @h_master = {is_trail_head: true, 
      section_number: Rails.configuration.custom_trail.num_of_sections, 
      distance_from_trail_start: Rails.configuration.custom_trail.max_distance_from_trail_start,
      name: "xxx",
      description: "xxx",
      latitude: Rails.configuration.custom_trail.bbox_max_lat,
      longitude: Rails.configuration.custom_trail.bbox_max_lng,
      elevation: Rails.configuration.custom_trail.max_elevation}
  end

  it "is valid with all valid values" do
    trail_site = TrailSite.create(@h_master)
    expect(trail_site).to be_valid
  end
  it "is created with all valid values" do
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to be_empty
  end
  it "is not valid without a trail head status" do
    @h_master[:is_trail_head]=nil
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end
  it "is not valid without a section number" do
    @h_master.delete(:section_number)
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end
  it "is not valid without a positive section number" do
    @h_master[:section_number]=-10
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end
  it "is not valid without a section number in the correct range" do
    @h_master[:section_number]=Rails.configuration.custom_trail.num_of_sections + 1
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end
  it "is not valid without trail distance from start" do
    @h_master[:distance_from_trail_start]=nil
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end
  it "is not valid when exceeds max trail distance from start" do
    @h_master[:distance_from_trail_start]=Rails.configuration.custom_trail.max_distance_from_trail_start + 1
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end
  it "is not valid when trail distance from start < 0" do
    @h_master[:distance_from_trail_start]=-1
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end
  it "is not valid when a name is not given" do
    @h_master[:name]=""
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end
  it "is not valid with a nill description" do
    @h_master[:description]=nil
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end
  it "is not valid with a zero length description" do
    @h_master[:description]=""
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end
  it "is not valid with description length >= 256" do
    @h_master[:description]="B"*256
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end
  it "is not valid with latitude exceeding max" do
    @h_master[:latitude]=Rails.configuration.custom_trail.bbox_max_lat + 1
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end
  it "is not valid with latitude less than min" do
    @h_master[:latitude]=Rails.configuration.custom_trail.bbox_min_lat - 1
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end
  it "is not valid with longitude exceeding max" do
    @h_master[:longitude]=Rails.configuration.custom_trail.bbox_max_lng + 1
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end
  it "is not valid with longitude exceeding max" do
    @h_master[:longitude]=Rails.configuration.custom_trail.bbox_min_lng - 1
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end
  it "is not valid with elevation exceeding max" do
    @h_master[:elevation]=Rails.configuration.custom_trail.max_elevation + 1
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end
  it "is not valid with elevation less than min" do
    @h_master[:elevation]=Rails.configuration.custom_trail.min_elevation - 1
    trail_site = TrailSite.create(@h_master)
    expect(trail_site.errors).to_not be_empty
  end

end
