require 'rails_helper'

RSpec.describe TrailSite, :type => :model do

  before(:each) do
    @h_master = {is_trail_head: true, 
      section_number: Rails.configuration.custom_trail.num_of_sections, 
      distance_from_trail_start: Rails.configuration.custom_trail.max_distance_from_trail_start,
      name: "xxx",
      description: "xxx",
      latitude: Rails.configuration.custom_trail.max_lat_north,
      longitude: 1,
      elevation: 1}
      puts @h_master
      @h_master
  end

  it "is valid with all valid values" do
    trail_site = TrailSite.new(@h_master)
    expect(trail_site).to be_valid
  end
  it "is not valid without a trail head status" do
    @h_master[:is_trail_head]=nil
    trail_site = TrailSite.new(@h_master)
    expect(trail_site).to_not be_valid
  end
  it "is not valid without a section number" do
    @h_master.delete(:section_number)
    trail_site = TrailSite.new(@h_master)
    expect(trail_site).to_not be_valid
  end
  it "is not valid without a positive section number" do
    @h_master[:section_number]=-10
    trail_site = TrailSite.new(@h_master)
    expect(trail_site).to_not be_valid
  end
  it "is not valid without a section number in the correct range" do
    @h_master[:section_number]=Rails.configuration.custom_trail.num_of_sections + 1
    trail_site = TrailSite.new(@h_master)
    expect(trail_site).to_not be_valid
  end
  it "is not valid without trail distance from start" do
    @h_master[:distance_from_trail_start]=nil
    trail_site = TrailSite.new(@h_master)
    expect(trail_site).to_not be_valid
  end
  it "is not valid when exceeds max trail distance from start" do
    @h_master[:distance_from_trail_start]=Rails.configuration.custom_trail.max_distance_from_trail_start + 1
    trail_site = TrailSite.new(@h_master)
    expect(trail_site).to_not be_valid
  end
  it "is not valid when trail distance from start < 0" do
    @h_master[:distance_from_trail_start]=-1
    trail_site = TrailSite.new(@h_master)
    expect(trail_site).to_not be_valid
  end
  it "is not valid with a nill description" do
    @h_master[:description]=nil
    trail_site = TrailSite.new(@h_master)
    expect(trail_site).to_not be_valid
  end
  it "is not valid with a zero length description" do
    @h_master[:description]=""
    trail_site = TrailSite.new(@h_master)
    expect(trail_site).to_not be_valid
  end
  it "is not valid with description length >= 256" do
    @h_master[:description]="B"*256
    trail_site = TrailSite.new(@h_master)
    expect(trail_site).to_not be_valid
  end
  it "is not valid with excess latitude north" do
    @h_master[:latitude]=Rails.configuration.custom_trail.max_lat_north + 1
    trail_site = TrailSite.new(@h_master)
    expect(trail_site).to_not be_valid
  end

  it "is not valid without a start_date"
  it "is not valid without a end_date"
end
