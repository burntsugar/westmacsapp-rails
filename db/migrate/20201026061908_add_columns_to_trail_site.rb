class AddColumnsToTrailSite < ActiveRecord::Migration[6.0]
  def change
    add_column :trail_sites, :name, :string, null: false, default: ''
    add_column :trail_sites, :description, :string, null: false, default: ''
    add_column :trail_sites, :latitude, :decimal, { precision: 10, scale: 6, default: 0 }
    add_column :trail_sites, :longitude, :decimal, { precision: 10, scale: 6, default: 0 }
    add_column :trail_sites, :elevation, :integer, { default: 0 }
  end
end
