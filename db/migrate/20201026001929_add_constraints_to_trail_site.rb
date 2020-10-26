class AddConstraintsToTrailSite < ActiveRecord::Migration[6.0]
  def change
    change_column_null :trail_sites, :is_trail_head, false, false
    change_column_null :trail_sites, :section_number, false, 0
    change_column_null :trail_sites, :distance_from_trail_start, false, 0
  end
end
