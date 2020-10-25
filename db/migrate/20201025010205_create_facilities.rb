class CreateFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :facilities do |t|
      t.integer :name_type
      t.text :description

      t.timestamps
    end
  end
end
