class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:contacts)
      create_table :contacts do |t|
        t.string  :first_name,    null: false
        t.string  :last_name,     null: false
        t.string  :phone_number,  null: false
        t.string  :email,         null: false
        t.boolean :active_status, default: true,  null: false
        t.boolean :del_status,    default: false, null: false
        t.string  :region,        null: false
        t.string  :residence,     null: false
        t.integer :location_id,  null: false
        t.integer :user_id,      null: false

        t.timestamps
      end

      add_index :contacts, :email, unique: true
      add_index :contacts, :phone_number, unique: true
      add_index :contacts, [:active_status, :del_status]
      add_index :contacts, :location_id
      add_index :contacts, :region
      add_index :contacts, :residence
    end
  end
end
