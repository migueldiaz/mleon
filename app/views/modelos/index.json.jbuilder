json.array!(@modelos) do |modelo|
  json.extract! modelo, :id, :nombre, :descripcion, :ancho, :alto, :fondo
  json.url modelo_url(modelo, format: :json)
end
