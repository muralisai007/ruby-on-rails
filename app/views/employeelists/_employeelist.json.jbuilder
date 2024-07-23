json.extract! employeelist, :id, :created_at, :updated_at
json.url employeelist_url(employeelist, format: :json)
