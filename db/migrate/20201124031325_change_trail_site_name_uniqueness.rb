class ChangeTrailSiteNameUniqueness < ActiveRecord::Migration[6.0]
  def change
    add_index :trail_sites, :name, unique: true
  end
end
