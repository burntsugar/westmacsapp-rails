require 'rails_helper'

RSpec.describe TrailSite, :type => :model do
  it "is not valid without a trail head status" do
    trail_site = TrailSite.new(is_trail_head: nil, section_number: 1, distance_from_trail_start: 10)
    expect(trail_site).to_not be_valid
  end
  it "is not valid without a valid section number" do
    trail_site = TrailSite.new(is_trail_head: true, section_number: -10, distance_from_trail_start: 10)
    expect(trail_site).to_not be_valid
  end
  it "is not valid without a description" do
    trail_site = TrailSite.new(is_trail_head: true, section_number: 1, distance_from_trail_start: -10)
    expect(trail_site).to_not be_valid
  end
  it "is not valid without a start_date"
  it "is not valid without a end_date"
end
