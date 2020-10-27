require 'rails_helper'



RSpec.describe TrailSite, :type => :model do

  before(:each) do
    @h_master = {is_trail_head: true, 
      section_number: 1, 
      distance_from_trail_start: Rails.configuration.custom_trail.num_of_sections,
      name: "xxx",
      description: "xxx",
      latitude: 1,
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
  it "is not valid without a valid section number" do
    @h_master[:section_number]=-10
    trail_site = TrailSite.new(@h_master)
    expect(trail_site).to_not be_valid
  end
  it "is not valid without a description" do
    @h_master[:distance_from_trail_start]=-10
    trail_site = TrailSite.new(@h_master)
    expect(trail_site).to_not be_valid
  end
  it "is not valid without a start_date"
  it "is not valid without a end_date"
end
