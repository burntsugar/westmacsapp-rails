class ChangeTrailSiteElevation < ActiveRecord::Migration[6.0]
  def change
    change_column :trail_sites, :elevation, :decimal, { precision: 10, scale: 6, default: 0 }
  end
end
