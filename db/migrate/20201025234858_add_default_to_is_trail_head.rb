class AddDefaultToIsTrailHead < ActiveRecord::Migration[6.0]
  def change
    change_column :trail_sites, :is_trail_head, :boolean, default: false
  end
end
