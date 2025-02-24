json.extract! contact, :id, :first_name, :last_name, :phone_number, :email, :active_status, :del_status, :region, :residence, :location_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
