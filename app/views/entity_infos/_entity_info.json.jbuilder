json.extract! entity_info, :id, :assigned_code, :entity_name, :entity_alias, :narration, :active_status, :del_status, :user_id, :created_at, :updated_at
json.url entity_info_url(entity_info, format: :json)
