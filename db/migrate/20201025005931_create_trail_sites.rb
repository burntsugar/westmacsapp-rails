class CreateTrailSites < ActiveRecord::Migration[6.0]
  def change
    create_table :trail_sites do |t|
      t.boolean :is_trail_head
      t.integer :section_number
      t.float :distance_from_trail_start

      t.timestamps
    end
  end
end
