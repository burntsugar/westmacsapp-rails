class CreateObservations < ActiveRecord::Migration[6.0]
  def change
    create_table :observations do |t|
      t.string :author_name
      t.text :note
      t.datetime :log_date

      t.references :loggable, polymorphic: true, index:true

      t.timestamps
    end
  end
end
