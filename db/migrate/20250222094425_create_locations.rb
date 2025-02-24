class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:locations)
      create_table :locations do |t|
        t.string  :region,    null: false
        t.string  :residence, null: false
        t.integer :creator_id, null: false
        t.boolean :active_status, default: true, null: false

        t.timestamps
      end

      add_index :locations, [:region, :residence], unique: true, name: "index_locations_on_region_and_residence"
      add_index :locations, :active_status
    end
  end
end
