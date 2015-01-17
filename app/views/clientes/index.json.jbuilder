json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nombre, :CIF, :telefono, :email, :direccion, :notas
  json.url cliente_url(cliente, format: :json)
end
