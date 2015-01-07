json.array!(@piezas) do |pieza|
  json.extract! pieza, :id, :nombre, :tipo, :descripcion, :ancho, :alto
  json.url pieza_url(pieza, format: :json)
end
