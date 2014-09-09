json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :city, :description
  json.url organization_url(organization, format: :json)
end
