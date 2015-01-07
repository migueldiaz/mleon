json.array!(@clases) do |clase|
  json.extract! clase, :id, :nombre, :descripcion
  json.url clase_url(clase, format: :json)
end
