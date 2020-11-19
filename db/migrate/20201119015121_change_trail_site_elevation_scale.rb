class ChangeTrailSiteElevationScale < ActiveRecord::Migration[6.0]
  def change
    change_column :trail_sites, :elevation, :decimal, { precision: 6, scale: 2, default: 0 }
  end
end
