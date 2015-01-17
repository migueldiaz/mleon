json.array!(@items) do |item|
  json.extract! item, :id, :pedido_id, :modelo_id, :cantidad
  json.url item_url(item, format: :json)
end
