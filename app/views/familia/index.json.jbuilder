json.array!(@familia) do |familium|
  json.extract! familium, :id, :nombre, :descripcion
  json.url familium_url(familium, format: :json)
end
