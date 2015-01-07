json.array!(@muebles) do |mueble|
  json.extract! mueble, :id, :nombre, :descripcion, :ancho, :alto, :fondo, :clase_id
  json.url mueble_url(mueble, format: :json)
end
